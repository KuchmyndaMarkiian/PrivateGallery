using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.Graphics;
using Android.Graphics.Drawables;
using Android.OS;
using Android.Provider;
using Android.Widget;
using Java.IO;
using PrivateGallery.Helpers;
using PrivateGallery.Infrastructure;
using PrivateGallery.Models;
using static PrivateGallery.Models.App;
using Bitmap = Android.Graphics.Bitmap;
using File = Java.IO.File;
using Settings = PrivateGallery.Infrastructure.Settings;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Activities
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/NoActionBar")]
    public class RegistrationScreen : Activity
    {
        private ImageView _imageView;
        private AlertDialog.Builder _dialog;
        private UserAccount _userAccount;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.RegistrationScreen);
            // Create your application here
            _userAccount = UserAccount.Instance;
            #region Dialog Setup

            _dialog = new AlertDialog.Builder(this);
            _dialog.SetPositiveButton("Camera", (sender, args) =>
                {
                    Intent intent = new Intent(MediaStore.ActionImageCapture);
                    App.File = new File(Dir, $"file_{DateTime.Now.ToLongTimeString()}.jpg");
                    intent.PutExtra(MediaStore.ExtraOutput, Uri.FromFile(App.File));
                    StartActivityForResult(intent, (int) PickFileTypes.Camera);
                })
                .SetNeutralButton("Gallery", (sender, args) =>
                {
                    Intent = new Intent();
                    Intent.SetType("image/*");
                    Intent.SetAction(Intent.ActionGetContent);
                    StartActivityForResult(Intent.CreateChooser(Intent, "Select Picture"), (int) PickFileTypes.Device);
                })
                .SetNegativeButton("Cancel", (sender, args) => (sender as AlertDialog).Cancel());

            #endregion

            #region ImagePicker

            var imagePicker = new ImagePicker(this);
            if (imagePicker.CanPickPhoto())
            {
                imagePicker.CreateStorage();
                _imageView = FindViewById<ImageView>(Resource.Id.imageReg);
                var picker = FindViewById<Button>(Resource.Id.pickImageReg);
                picker.Click += (sender, args) =>
                {
                    _dialog.Show();
                };
            }

            #endregion

            #region Fields init

            FindViewById<EditText>(Resource.Id.firstNameField).AfterTextChanged +=
                (sender, args) => _userAccount.FirstName = (sender as EditText).Text;
            FindViewById<EditText>(Resource.Id.lastNameField).AfterTextChanged +=
                (sender, args) => _userAccount.LastName = (sender as EditText).Text;
            FindViewById<EditText>(Resource.Id.emailField).AfterTextChanged +=
                (sender, args) => _userAccount.Email = (sender as EditText).Text;
            FindViewById<EditText>(Resource.Id.passwordField).AfterTextChanged +=
                (sender, args) => _userAccount.Password= (sender as EditText).Text;

            #endregion

            #region Button init

            FindViewById<Button>(Resource.Id.signUpButton).Click += RegistrationScreen_Click;

            #endregion
        }

       

        #region Registration

         private void RegistrationScreen_Click(object sender, EventArgs e)
        {
            var loadingDialog = new Dialog(this);
            loadingDialog.InitializeLoadingDialog();
            loadingDialog.Show();
            Task.Run(async () =>
            {
                using (var service = new AutorizationService())
                {
                    service.Register(ref _userAccount);
                    if (service.IsSuccessful())
                    {
                        service.SignIn(ref _userAccount);
                        if (service.IsSuccessful())
                        {
                            using (HttpManager manager = new HttpManager(Settings.Instance.ServerAdress))
                            {
                                manager.AccessToken = _userAccount.UserToken.AccessToken;
                                _userAccount.Clone(
                                    await manager.GetData<AccountInfoViewModel>(Settings.Instance.UserInfo));
                                var name = _userAccount.Email.Split('@').First();
                                //todo:need normal split params
                                if (!manager.PostFile(Settings.Instance.PictureAdress,
                                    (name + App.File.Name.Split('.').Last(),
                                    _userAccount.Email.Split('@').First(),
                                    ImageConvert(_imageView.DrawingCache))))
                                {
                                    RunOnUiThread(() => Toast.MakeText(this, "Picture didn't uploaded.", ToastLength.Short).Show());
                                }
                            }
                            RunOnUiThread(() =>
                            {
                                loadingDialog.Dismiss();
                                var main = new Intent(this, typeof(MainScreen));
                                StartActivity(main);
                                Finish();
                            });
                        }
                        else
                        {
                            RunOnUiThread(() => Toast.MakeText(this, "Signing in isn`t executed.", ToastLength.Short).Show());
                        }
                    }
                    else
                    {
                        RunOnUiThread(() => Toast.MakeText(this, service.GetMessage(), ToastLength.Short).Show());
                    }
                }
                RunOnUiThread(() => loadingDialog.Dismiss());
            });


            Stream ImageConvert(Bitmap imageViewDrawable)
            {
                string path = System.IO.Path.Combine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.MyDocuments), "image.png");
                using (var stream = System.IO.File.OpenWrite(path))
                {
                    imageViewDrawable.Compress(Bitmap.CompressFormat.Png, 100, stream);
                    return stream;
                }
            }
        }

        #endregion
        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            Uri uri = null;
            switch (requestCode)
            {
                case (int) PickFileTypes.Camera:
                {
                    var mediaScanIntent = new Intent(Intent.ActionMediaScannerScanFile);
                    uri = Uri.FromFile(App.File);
                    mediaScanIntent.SetData(uri);
                    SendBroadcast(mediaScanIntent);

                    App.Bitmap = BitmapFactory.DecodeFile(App.File.Path,
                        new BitmapFactory.Options {InJustDecodeBounds = true});
                    if (App.Bitmap != null)
                    {
                        _imageView.SetImageBitmap(App.Bitmap);
                    }
                    break;
                }
                case (int) PickFileTypes.Device:
                {
                    if (resultCode == Result.Ok && data != null)
                    {
                        uri = data.Data;
                        _imageView.SetImageURI(uri);
                    }
                    break;
                }
            }
            GC.Collect();
        }
    }
}
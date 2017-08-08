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
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Models;
using Bitmap = Android.Graphics.Bitmap;
using File = Java.IO.File;
using Settings = PrivateGallery.Android.Infrastructure.Settings;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/Theme.Custom")]
    public class RegistrationScreen : Activity
    {
        private ImageView _imageView;
        private AlertDialog.Builder _dialog;
        private UserAccount _userAccount;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.RegistrationScreen);
            _userAccount = UserAccount.Instance;

            #region Dialog Setup

            _dialog = new AlertDialog.Builder(this);
            _dialog.SetPositiveButton("Camera", (sender, args) =>
                {
                    Intent intent = new Intent(MediaStore.ActionImageCapture);
                    App.File = new File(App.Dir, $"file_{DateTime.Now.ToLongTimeString()}.jpg");
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
                .SetNegativeButton("Cancel", (sender, args) => ((AlertDialog) sender).Cancel());

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
                (sender, args) => _userAccount.FirstName = ((EditText) sender).Text;
            FindViewById<EditText>(Resource.Id.lastNameField).AfterTextChanged +=
                (sender, args) => _userAccount.LastName = ((EditText) sender).Text;
            FindViewById<EditText>(Resource.Id.emailField).AfterTextChanged +=
                (sender, args) => _userAccount.Email = ((EditText) sender).Text;
            FindViewById<EditText>(Resource.Id.passwordField).AfterTextChanged +=
                (sender, args) => _userAccount.Password = ((EditText) sender).Text;

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
                            using (HttpManager manager = new HttpManager(Settings.ServerAdress))
                            {
                                manager.AccessToken = _userAccount.UserToken.AccessToken;
                                _userAccount.Clone(
                                    await manager.GetData<AccountInfoViewModel>(Settings.UserInfo));
                                var name = _userAccount.Email.Split('@').First();
                                var format = App.File.Name.Split('.').Last();
                                var compressType = Bitmap.CompressFormat.Webp;
                                if (format.ToLowerInvariant() == "jpg" || format.ToLowerInvariant() == "jpeg")
                                    compressType = Bitmap.CompressFormat.Jpeg;
                                else if (format.ToLowerInvariant() == "png")
                                {
                                    compressType = Bitmap.CompressFormat.Png;
                                }
                                Drawable d = _imageView.Drawable;
                                Bitmap bitmap = ((BitmapDrawable) d).Bitmap;
                                var stream = new MemoryStream();
                                bitmap.Compress(compressType, 100, stream);
                                if (manager.PostFile(Settings.PictureAdress,
                                    new HttpManager.StreamPack
                                    {
                                        Stream = stream.ToArray(),
                                        FullName = $"{name}.{App.File.Name.Split('.').Last()}",
                                        Name = _userAccount.Email.Split('@').First()
                                    })
                                )
                                {
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
                                    RunOnUiThread(() => Toast
                                        .MakeText(this, "Picture didn't uploaded.", ToastLength.Short)
                                        .Show());
                                }
                            }
                        }
                        else
                        {
                            RunOnUiThread(() => Toast.MakeText(this, "Signing in isn`t executed.", ToastLength.Short)
                                .Show());
                        }
                    }
                    else
                    {
                        RunOnUiThread(() => Toast.MakeText(this, service.GetMessage(), ToastLength.Short).Show());
                    }
                }
                RunOnUiThread(() => loadingDialog.Dismiss());
            });
        }

        #endregion

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            Uri uri;
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
                        var path = FileHelper.GetRealPathFromUri(uri, this);
                        App.File = new File(path);
                        _imageView.SetImageURI(uri);
                    }
                    break;
                }

            }
        }
    }
}
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
using PrivateGallery.Common.BindingModels;
using File = Java.IO.File;
using Settings = PrivateGallery.Android.Infrastructure.Settings;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/Theme.Custom")]
    public class PhotoEditScreen : Activity
    {
        private bool _isCapturedPicture = false;
        private AlertDialog.Builder _dialog;
        private PictureBindingModel _model = new PictureBindingModel();
        private MemoryStream _stream=new MemoryStream();
        string path;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.PhotoEditScreen);
            // Create your application here
            _model.GalleryName = Intent.GetStringExtra("galleryName");

            #region UIElement's events

            FindViewById<EditText>(Resource.Id.pictureDescription).AfterTextChanged +=
                (sender, args) => _model.Description = (sender as EditText).Text;
            FindViewById<Button>(Resource.Id.uploadPictureFull).Click += UploadPhoto;

            #endregion

            #region PickerDialog

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
                FindViewById<Button>(Resource.Id.pickPicture).Click += (sender, args) =>
                {
                    _dialog.Show();
                };
            }

            #endregion
        }



        private void UploadPhoto(object sender, EventArgs e)
        {
            if (_model.Content == null || string.IsNullOrEmpty(path)) return;
            var dialog = new Dialog(this);
            dialog.InitializeLoadingDialog();
            dialog.Show();
            var instance = UserAccount.Instance;
            var date = DateTime.Now;
            string name =
                $"{instance.FirstName + instance.LastName}{Math.Round(date.TimeOfDay.TotalMilliseconds)}.{path.Split('.').Last()}";
            Task.Run(async () =>
            {
                using (var cloud =
                    new PrivateGalleryCloudSystem(
                        new HttpManager(Settings.ServerAdress)
                        {
                            AccessToken = UserAccount.Instance.UserToken.AccessToken
                        }))
                {

                    if (await cloud.CreatePicture(name, _model.GalleryName, date, _model.Description, "2222"))
                    {
                        int i = 0;
                        while (i++ < 3)
                        {
                            if (!cloud.UploadPicture(new HttpManager.StreamPack
                            {
                                Name = _model.GalleryName,
                                FullName = name,
                                Stream = _stream.ToArray()
                            }))
                            {
                                RunOnUiThread(() => Toast.MakeText(this, "Server Error", ToastLength.Short).Show());
                            }
                        }
                    }
                    else
                    {
                        RunOnUiThread(() => Toast.MakeText(this, "Server Error", ToastLength.Short).Show());
                    }
                    RunOnUiThread(() => dialog.Dismiss());
                }
            });
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            Uri uri;
            _model.Content = new MemoryStream();
            var imageView = FindViewById<ImageView>(Resource.Id.pickedPhoto);
            switch (requestCode)
            {
                case (int) PickFileTypes.Camera:
                {
                    var mediaScanIntent = new Intent(Intent.ActionMediaScannerScanFile);
                    uri = Uri.FromFile(App.File);
                    path = App.File.Path;
                    mediaScanIntent.SetData(uri);
                    SendBroadcast(mediaScanIntent);
                    if (App.Bitmap != null)
                    {
                        var bit = BitmapFactory.DecodeFile(path);
                        imageView.SetImageBitmap(bit);
                    }
                    break;
                }
                case (int) PickFileTypes.Device:
                {
                    if (resultCode == Result.Ok && data != null)
                    {
                        uri = data.Data;
                        path = FileHelper.GetRealPathFromUri(uri, this);
                        var bit = BitmapFactory.DecodeFile(path);
                        imageView.SetImageBitmap(bit);
                    }
                    break;
                }
            }
            var format = path.Split('.').Last();
            var compressType = Bitmap.CompressFormat.Webp;
            if (format.ToLowerInvariant() == "jpg" || format.ToLowerInvariant() == "jpeg")
                compressType = Bitmap.CompressFormat.Jpeg;
            else if (format.ToLowerInvariant() == "png")
            {
                compressType = Bitmap.CompressFormat.Png;
            }
            Drawable d = imageView.Drawable;
            Bitmap bitmap = ((BitmapDrawable) d).Bitmap;
            bitmap.Compress(compressType, 100, _stream);
        }
    }
}

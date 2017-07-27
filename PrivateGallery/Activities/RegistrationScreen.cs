using System;
using Android.App;
using Android.Content;
using Android.Graphics;
using Android.OS;
using Android.Provider;
using Android.Widget;
using Java.IO;
using Java.Net;
using PrivateGallery.Infrastructure;
using PrivateGallery.Models;
using static PrivateGallery.Models.App;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Activities
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/NoActionBar")]
    public class RegistrationScreen : Activity
    {
        private ImageView _imageView;
        private AlertDialog.Builder _dialog;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.RegistrationScreen);
            // Create your application here

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
        }

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
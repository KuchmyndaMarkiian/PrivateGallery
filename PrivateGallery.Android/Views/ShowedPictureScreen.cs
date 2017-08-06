using System;
using System.IO;
using Android.App;
using Android.Graphics;
using Android.OS;
using Android.Widget;
using Newtonsoft.Json;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Models;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "ShowedPictureScreen", Theme = "@style/Theme.Custom")]
    public class ShowedPictureScreen : Activity
    {
        private PictureModel _model;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.ShowedPictureScreen);

            // Create your application here
            _model = JsonConvert.DeserializeObject<PictureModel>(Intent.GetStringExtra("picture"));
            FindViewById<ImageView>(Resource.Id.showPictureView)
                .SetImageBitmap(BitmapFactory.DecodeStream(new MemoryStream(_model.Content)));
            FindViewById<ImageButton>(Resource.Id.deletePictureButton).Click += DeleteEvent;
            FindViewById<ImageButton>(Resource.Id.infoPictureButton).Click += ShowInfo;
        }

        private void ShowInfo(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        private async void DeleteEvent(object sender, System.EventArgs e)
        {
            using (var cloud = new PrivateGalleryCloudSystem(new HttpManager(Settings.ServerAdress){AccessToken = UserAccount.Instance.UserToken.AccessToken}))
            {
                Toast.MakeText(this,
                        await cloud.DeletePicture(_model.Name, _model.GalleryName) ? "Deleted" : "ServerError",
                        ToastLength.Short)
                    .Show();
                Finish();
                MoveTaskToBack(true);
            }
        }
    }
}
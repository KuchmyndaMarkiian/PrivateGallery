using System;
using System.IO;
using System.Text;
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
            _model = JsonConvert.DeserializeObject<PictureModel>(Intent.GetStringExtra("picture"));
            FindViewById<ImageView>(Resource.Id.showPictureView)
                .SetImageBitmap(BitmapFactory.DecodeStream(new MemoryStream(_model.Content)));
            FindViewById<ImageButton>(Resource.Id.deletePictureButton).Click += DeleteEvent;
            FindViewById<ImageButton>(Resource.Id.infoPictureButton).Click += ShowInfo;
        }

        /// <summary>
        /// Shows details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowInfo(object sender, EventArgs e)
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine($"Name: {_model.Name}");
            builder.AppendLine($"Date: {_model.DateTime.ToShortDateString()}");
            builder.AppendLine($"Geo: {_model.Geolocation ?? "Not setted"}");
            builder.AppendLine($"Descriprion: {_model.Description ?? "Empty"}");
            AlertDialog.Builder dBuilder =
                new AlertDialog.Builder(this).SetPositiveButton("Ok", (o, args) => ((AlertDialog) o).Dismiss())
                    .SetTitle("Information")
                    .SetMessage(builder.ToString());
            dBuilder.Show();
        }

        /// <summary>
        /// Deletes picture from server
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private async void DeleteEvent(object sender, System.EventArgs e)
        {
            using (var cloud =
                new PrivateGalleryCloudSystem(
                    new HttpManager(Settings.ServerAdress) {AccessToken = UserAccount.Instance.UserToken.AccessToken}))
            {
                Toast.MakeText(this,
                        await cloud.DeletePicture(_model.Name, _model.GalleryName) ? "Deleted" : "ServerError",
                        ToastLength.Short)
                    .Show();
                Finish();
                MoveTaskToBack(true);
            }
        }f
    }
}
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Graphics;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Newtonsoft.Json;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Activities
{
    [Activity(Label = "Anonymous Gallery")]
    class GalleryScreen : Activity
    {
        private GridView _layout;
        private PictureAdapter _pictureAdapter;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.GalleryScreen);
            _layout = FindViewById<GridView>(Resource.Id.pictureGridLayout);
            if (RequestedOrientation == ScreenOrientation.Portrait)
            {
                _layout.SetNumColumns(3);
            }

        }

        protected override void OnResume()
        {
            base.OnResume();
            var loadingDialog = new Dialog(this);
            loadingDialog.SetContentView(Resource.Layout.LoadingDialog);
            loadingDialog.Show();
            var extra = JsonConvert.DeserializeObject<List<PictureBindingModel>>(Intent.GetStringExtra("photos"));
            Task.Run(() =>
            {
                using (var cloud =
                    new PrivateGalleryCloudSystem(
                        new HttpManager(Settings.ServerAdress)
                        {
                            AccessToken = UserAccount.Instance.UserToken.AccessToken
                        }))
                {
                    extra.ForEach(async model =>
                        {
                            model.Content = new BufferedStream(await cloud.DownloadPicture(model.GalleryName, model.Name));
                        }
                    );
                }
                RunOnUiThread(() =>
                {
                    _pictureAdapter = new PictureAdapter(extra, this);
                    _layout.Adapter = _pictureAdapter;
                    loadingDialog.Dismiss();
                });
            });
        }
    }
}
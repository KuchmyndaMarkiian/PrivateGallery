using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using com.refractored.fab;
using Newtonsoft.Json;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Models;
using PrivateGallery.Common.BindingModels;
using Settings = PrivateGallery.Android.Infrastructure.Settings;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/Theme.Custom")]
    class GalleryScreen : Activity
    {
        #region Fields

        private GridView _gridView;
        private PictureAdapter _pictureAdapter;
        private GalleryStructure _galleryStructure;

        #endregion

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.GalleryScreen);
            _gridView = FindViewById<GridView>(Resource.Id.PictureList);
            _gridView.NumColumns = 3;
            var fab = FindViewById<FloatingActionButton>(Resource.Id.FabButtonPicture);
            _gridView.ItemClick += ShowPicture;
            fab.AttachToListView(_gridView);
            fab.Click += UploadPicture;
        }

        /// <summary>
        /// Uploads picture on floating button
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UploadPicture(object sender, EventArgs e)
        {
            Intent intent = new Intent(this, typeof(PhotoEditScreen));
            intent.PutExtra("gallery", JsonConvert.SerializeObject(_galleryStructure));
            StartActivity(intent);
        }

        /// <summary>
        /// Opens picture in new view
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowPicture(object sender, AdapterView.ItemClickEventArgs e)
        {
            Intent intent = new Intent(this, typeof(ShowedPictureScreen));
            var x = _galleryStructure.Pictures.ElementAt(e.Position);
            intent.PutExtra("picture", JsonConvert.SerializeObject(new PictureModel
            {
                Content = ((MemoryStream) x.Content).ToArray(),
                GalleryName = x.GalleryName,
                Name = x.Name,
                DateTime = x.DateTime,
                Description = x.Description,
                Geolocation = x.Geolocation
            }));
            StartActivity(intent);
        }

        protected override void OnRestart()
        {
            _gridView.Adapter = null;
            OnResume();
        }

        protected override void OnResume()
        {
            base.OnResume();
            var loadingDialog = new Dialog(this);
            loadingDialog.SetContentView(Resource.Layout.LoadingDialog);
            loadingDialog.Show();
            _galleryStructure = JsonConvert.DeserializeObject<GalleryStructure>(Intent.GetStringExtra("gallery"));
            Task.Run(() =>
            {
                var list = _galleryStructure.Pictures.ToList();
                using (var cloud =
                    new PrivateGalleryCloudSystem(
                        new HttpManager(Settings.ServerAdress)
                        {
                            AccessToken = UserAccount.Instance.UserToken.AccessToken
                        }))
                {
                    list.ForEach(async model =>
                        {
                            model.Content = await cloud.DownloadPicture(model.GalleryName, model.Name);
                        }
                    );
                }
                RunOnUiThread(() =>
                {
                    _pictureAdapter = new PictureAdapter(list, this);
                    _gridView.Adapter = _pictureAdapter;
                    loadingDialog.Dismiss();
                });
            });
        }
    }
}
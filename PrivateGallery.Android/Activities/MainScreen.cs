using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using com.refractored.fab;
using Newtonsoft.Json;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;

namespace PrivateGallery.Android.Activities
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/NoActionBar")]
    public class MainScreen : Activity
    {
        private ListView _listView;
        private GalleryAdapter _galleryAdapter;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.MainScreen);
            // Create your application here
            _listView = FindViewById<ListView>(Resource.Id.GalleryList);
            var fab = FindViewById<FloatingActionButton>(Resource.Id.FabButton);
            _listView.ItemClick += _listView_ItemClick;
            fab.AttachToListView(_listView);
        }

        protected override void OnResume()
        {
            base.OnResume();
            var loadingDialog = new Dialog(this);
            loadingDialog.InitializeLoadingDialog();
            loadingDialog.Show();
            Task.Run(async () =>
            {
                var cloudSystem =
                    new PrivateGalleryCloudSystem(
                        new HttpManager(Settings.ServerAdress)
                        {
                            AccessToken = UserAccount.Instance.UserToken.AccessToken
                        });
                var list = await cloudSystem.DownloadGalleries();
                list.ForEach(structure =>
                {
                    var name = structure.Name;
                    foreach (var pictureBindingModel in structure.Pictures)
                    {
                        pictureBindingModel.GalleryName = name;
                    }
                });
                RunOnUiThread(() =>
                {
                    _galleryAdapter = new GalleryAdapter(list, this);
                    _listView.Adapter = _galleryAdapter;
                    loadingDialog.Dismiss();
                });
            });
        }

        private void _listView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var @object=_galleryAdapter[e.Position];
            Intent intent=new Intent(this, typeof(GalleryScreen));
            intent.PutExtra("photos", JsonConvert.SerializeObject(@object.Pictures));
            StartActivity(intent);
        }
    }
}
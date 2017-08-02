using System.Threading.Tasks;
using Android.App;
using Android.OS;
using Android.Widget;
using com.refractored.fab;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;

namespace PrivateGallery.Android.Activities
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/NoActionBar")]
    public class MainScreen : Activity
    {
        private ListView _listView;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.MainScreen);
            // Create your application here
            _listView = FindViewById<ListView>(Resource.Id.GalleryList);
            var fab = FindViewById<FloatingActionButton>(Resource.Id.FabButton);
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

                RunOnUiThread(() =>
                {
                    _listView.Adapter = new GalleryAdapter(list, this);
                    loadingDialog.Dismiss();
                });
            });
        }
    }
}
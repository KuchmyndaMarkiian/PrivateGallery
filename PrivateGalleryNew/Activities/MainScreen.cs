using System.Threading.Tasks;
using Android.App;
using Android.OS;
using Android.Widget;
using com.refractored.fab;
using PrivateGalleryNew.Helpers;
using PrivateGalleryNew.Infrastructure;

namespace PrivateGalleryNew.Activities
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
            Task.Run(async () => {
                var cloudSystem = new PrivateGalleryCloudSystem(new HttpManager(Settings.ServerAdress));
                var list=await cloudSystem.DownloadGalleries();

                _listView.Adapter= new GalleryAdapter(list,this);


                RunOnUiThread(() => loadingDialog.Dismiss());
            });

            
        }
    }
}
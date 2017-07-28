using Android.App;
using Android.OS;
using Android.Widget;
using com.refractored.fab;

namespace PrivateGalleryNew.Activities
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/NoActionBar")]
    public class MainScreen : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.MainScreen);
            // Create your application here
            var listView = FindViewById<ListView>(Resource.Id.GalleryList);
            var fab = FindViewById<FloatingActionButton>(Resource.Id.FabButton);
            fab.AttachToListView(listView);
        }
    }
}
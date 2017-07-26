using Android.App;
using Android.OS;

namespace PrivateGallery.Activities
{
    [Activity(Label = "Anonymous Gallery", MainLauncher = true, Theme = "@style/NoActionBar")]
    public class LoginScreen : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.PhotoEditScreen/*Resource.Layout.LoginScreen*/);
            // Create your application here
        }
    }
}
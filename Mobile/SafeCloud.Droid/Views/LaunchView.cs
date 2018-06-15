using Android.App;
using Android.Content;
using Android.OS;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "SafeCloud", MainLauncher = true, NoHistory = true)]
    public class LauncherView : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
            SetContentView(Resource.Layout.Launcher);
        }

        protected override void OnResume()
        {
            base.OnResume();
            var intent = new Intent(this, typeof(AuthorizationView));
            StartActivity(intent);
            Finish();
        }
    }
}
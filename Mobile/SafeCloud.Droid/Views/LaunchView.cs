using Android.App;
using Android.OS;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "SafeCloud", MainLauncher = true, NoHistory = true)]
    public class LaunchView : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
        }
    }
}
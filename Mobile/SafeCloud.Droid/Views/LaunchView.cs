using Android.App;
using Android.OS;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "SafeCloud", MainLauncher = true, NoHistory = true, Theme = "@style/LauncherTheme")]
    public class LauncherView : RxActivity<LauncherViewModel>
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            ViewModel = new LauncherViewModel();
            base.OnCreate(savedInstanceState);

            // Create your application here
            SetContentView(Resource.Layout.Launcher);
        }

        protected override void OnResume()
        {
            base.OnResume();
            ViewModel?.StartCommand.Execute(null);
        }
    }
}
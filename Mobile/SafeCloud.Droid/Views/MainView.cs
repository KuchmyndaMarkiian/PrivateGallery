using Android.App;
using Android.OS;
using SafeCloud.ClientCore.MVVM.ViewModels.FileStructure;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "SafeCloud", Theme = "@style/LauncherTheme")]
    public class MainView : ReactiveView<FileListViewModel>
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here
            SetContentView(Resource.Layout.MainScreen);
        }
    }
}
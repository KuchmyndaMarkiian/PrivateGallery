using Android.App;
using Android.OS;
using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.MVVM.ViewModels.AuthStructure;
using SafeCloud.Droid.Abstractions.View;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "SafeCloud", MainLauncher = true, NoHistory = true, Theme = "@style/LauncherTheme")]
    public class LauncherView : ReactiveView<AuthorizationView>
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
            ApplicationFacade.Facade.Navigator.RedirectTo<AuthorizationViewModel>(model =>
                {
                    model.LoginModel.Login = "mark0611@gmail.com";
                    model.LoginModel.Password = "Mark95!";
                },true);
        }
    }
}
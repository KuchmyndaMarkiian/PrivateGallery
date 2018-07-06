using Android.App;
using Android.OS;
using Android.Support.Design.Widget;
using Android.Support.V4.Widget;
using Android.Widget;
using ReactiveUI;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "MainNavigationScreen",Theme = "@style/SafeCloudTheme")]
    public class MainNavigationScreen : RxAppCompatActivity<MainNavigationViewModel>, IFragmentKeeper
    {
        public int MainFragmentContainerId { get; } = Resource.Id.MainContentFrameLayout;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            SetContentView(Resource.Layout.MainNavigationDrawerView);
            base.OnCreate(savedInstanceState);
            // Create your application here
            
            MainViewNavigationView.NavigationItemSelected+=OnNavigationItemSelected;
        }

        private void OnNavigationItemSelected(object sender, NavigationView.NavigationItemSelectedEventArgs navigationItemSelectedEventArgs)
        {
            navigationItemSelectedEventArgs.MenuItem.SetChecked(true);
            switch (navigationItemSelectedEventArgs.MenuItem.ItemId)
            {
                /*case Resource.Id.NavHomeMenuItem:
                    break;*/
                case Resource.Id.NavDebugMenuItem:
                    ViewModel.DebugPageCommand.Execute(null);
                    break;
                case Resource.Id.NavSettingsMenuItem:
                    ViewModel.SettingsPageCommand.Execute(null);
                    break;
            }
            navigationItemSelectedEventArgs.MenuItem.SetChecked(false);
            MainDrawerLayout.CloseDrawers();
        }

        public FrameLayout MainContentFrameLayout => this.GetControl<FrameLayout>();
        public DrawerLayout MainDrawerLayout => this.GetControl<DrawerLayout>();

        public NavigationView MainViewNavigationView => this.GetControl<NavigationView>();
    }
}
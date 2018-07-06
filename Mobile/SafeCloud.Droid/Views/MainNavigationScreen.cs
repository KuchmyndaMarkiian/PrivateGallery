using Android.App;
using Android.OS;
using Android.Support.Design.Widget;
using Android.Views;
using Android.Widget;
using ReactiveUI.AndroidSupport;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "MainNavigationScreen")]
    public class MainNavigationScreen : RxAppCompatActivity<MainNavigationViewModel>, IFragmentKeeper
    {
        public int MainFragmentContainerId { get; } = Resource.Id.MainContentFrameLayout;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here

            SetContentView(Resource.Layout.MainNavigationDrawerView);
        }
        public FrameLayout MainContentFrameLayout => this.GetControl<FrameLayout>();
        public NavigationView MainViewNavigationView => this.GetControl<NavigationView>();
    }
}
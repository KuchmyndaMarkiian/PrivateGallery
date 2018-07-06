using Android.App;
using Android.OS;
using MkCoreLibrary.PlatformManagement.Infrastructure;
using MkCoreLibrary.ViewModels;
using ReactiveUI.AndroidSupport;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class RxAppCompatActivity<TViewModel> : ReactiveAppCompatActivity<TViewModel> where TViewModel : ReactiveViewModel
    {
        public virtual void Initialize(){}
        protected override void OnCreate(Bundle savedInstanceState)
        {
            if (ApplicationFacade.Facade == null)
                DroidFacade.Initialize();
            base.OnCreate(savedInstanceState);
            Initialize();
            BindProperties();
            BindCommands();
            if (ApplicationFacade.Facade.Navigator is INavigator<Activity> facadeNavigator)
                facadeNavigator.PlatformNavigationController = this;
        }

        protected virtual void BindProperties() { }
        protected virtual void BindCommands() { }
    }

    public interface IFragmentKeeper
    {
        int MainFragmentContainerId { get; }
    }
}
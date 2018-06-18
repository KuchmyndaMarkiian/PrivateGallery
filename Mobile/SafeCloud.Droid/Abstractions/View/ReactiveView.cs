using Android.App;
using Android.OS;
using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class ReactiveView<TViewModel> : ReactiveActivity<TViewModel> where TViewModel : ReactiveViewModel
    {
        public virtual void Initialize()
        {
            if (ApplicationFacade.Facade == null)
                DroidFacade.Initialize();

            if (ApplicationFacade.Facade.Navigator is INavigator<Activity> facadeNavigator)
                facadeNavigator.PlatformNavigationController = this;

            var model = ApplicationFacade.Facade.Navigator.CurrenViewModel as TViewModel;
            if (model != null)
                ViewModel = model;
            else
            {
                ViewModel = ApplicationFacade.Facade.CreateViewModel<TViewModel>();
                ViewModel.Initialize();
            }
        }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Initialize();
            BindProperties();
            BindCommands();
        }

        protected virtual void BindProperties() { }
        protected virtual void BindCommands() { }
    }
}
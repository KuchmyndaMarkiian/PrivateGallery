using System;
using Android.App;
using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class RxFragment<TViewModel> : ReactiveFragment<TViewModel> where TViewModel : ReactiveViewModel
    {
        public Action<TViewModel> ViewModelInitialize { get; set; }
        public virtual void Initialize()
        {
            if (ApplicationFacade.Facade == null)
                DroidFacade.Initialize();

            if (ApplicationFacade.Facade.Navigator is INavigator<Activity> facadeNavigator)
                facadeNavigator.PlatformNavigationController = this.Activity;

            if (ApplicationFacade.Facade.Navigator.CurrenViewModel is TViewModel model)
                ViewModel = model;
            else
            {
                ViewModel = ApplicationFacade.Facade.Resolver.CreateObject<TViewModel>();
                ViewModelInitialize?.Invoke(ViewModel);
                ViewModel.Initialize();
            }

            BindProperties();
            BindCommands();
        }

        protected virtual void BindProperties() { }
        protected virtual void BindCommands() { }
    }
}
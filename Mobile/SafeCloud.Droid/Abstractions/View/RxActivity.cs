using System;
using Android.App;
using Android.OS;
using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class RxActivity<TViewModel> : ReactiveActivity<TViewModel> where TViewModel : ReactiveViewModel
    {
        public Action<TViewModel> ViewModelInitialize { get; set; }
        public virtual void Initialize()
        {
            if (ApplicationFacade.Facade == null)
                DroidFacade.Initialize();

            if (ApplicationFacade.Facade.Navigator.CurrenViewModel is TViewModel model)
                ViewModel = model;
            else
            {
                ViewModel = ApplicationFacade.Facade.Resolver.CreateObject<TViewModel>();
                ViewModelInitialize?.Invoke(ViewModel);
                ViewModel.Initialize();
            }
        }

        protected override void OnResume()
        {
            base.OnResume();
            if (ApplicationFacade.Facade.Navigator is INavigator<Activity> facadeNavigator)
                facadeNavigator.PlatformNavigationController = this;
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
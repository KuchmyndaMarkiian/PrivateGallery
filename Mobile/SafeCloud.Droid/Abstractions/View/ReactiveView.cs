using System;
using Android.App;
using Android.OS;
using Newtonsoft.Json;
using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class ReactiveView<TViewModel> : ReactiveActivity<TViewModel> where TViewModel : class
    {
        public abstract void Initialize();

        protected override void OnCreate(Bundle savedInstanceState)
        {
            if (ApplicationFacade.Facade == null)
            {
                DroidFacade.Initialize();

                if (ApplicationFacade.Facade.Navigator is INavigator<Activity> facadeNavigator)
                    facadeNavigator.PlatformNavigationController = this;
            }
            else
            {
                if (ApplicationFacade.Facade.Navigator is INavigator<Activity> facadeNavigator)
                    facadeNavigator.PlatformNavigationController = this;

                var value = Intent?.Extras?.GetString("ViewModel");
                if (!string.IsNullOrEmpty(value))
                    ViewModel = JsonConvert.DeserializeObject<TViewModel>(value);
            }
           
            BindProperties();
            base.OnCreate(savedInstanceState);
            Initialize();
            BindCommands();
        }

        protected abstract void BindProperties();
        protected abstract void BindCommands();
    }
}
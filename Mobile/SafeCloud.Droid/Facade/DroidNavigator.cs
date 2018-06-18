using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Newtonsoft.Json;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.Droid.Facade
{
    public class DroidNavigator : INavigator<Activity>
    {
        public ReactiveViewModel CurrenViewModel { get; private set; }

        public Task<TViewModel> RedirectTo<TViewModel>(Action<TViewModel> initViewAction = null,
            bool removeFromHistory = false) where TViewModel : ReactiveViewModel
        {
            if (PlatformNavigationController == null)
                throw new NullReferenceException("PlatformNavigationController == null");

            var newVm = Activator.CreateInstance<TViewModel>();
            initViewAction?.Invoke(newVm);

            var newActivity = new Intent(PlatformNavigationController,
                ApplicationFacade.Facade.GetMappedView<TViewModel>());

            var bundleOptions = new Bundle();
            bundleOptions.PutString("ViewModel", JsonConvert.SerializeObject(newVm));

            PlatformNavigationController.StartActivity(newActivity, bundleOptions);
            if (removeFromHistory)
                PlatformNavigationController.Finish();

            CurrenViewModel = newVm;
            return Task.FromResult(newVm);
        }

        public Activity PlatformNavigationController { get; set; }
    }
}
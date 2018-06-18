using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.Widget;
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

            var newVm = ApplicationFacade.Facade.CreateViewModel<TViewModel>();
            newVm?.Initialize();
            initViewAction?.Invoke(newVm);

            var newActivity = new Intent(PlatformNavigationController,
                ApplicationFacade.Facade.GetMappedView<TViewModel>());
            
            PlatformNavigationController.StartActivity(newActivity);
            if (removeFromHistory)
                PlatformNavigationController.Finish();

            CurrenViewModel = newVm;
            return Task.FromResult(newVm);
        }

        public Task ShowErrorMessage(string s)
        {
            Toast.MakeText(PlatformNavigationController, s, ToastLength.Short).Show();
            return Task.CompletedTask;
        }

        public Activity PlatformNavigationController { get; set; }
    }
}
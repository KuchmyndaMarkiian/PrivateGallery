using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.Widget;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Facade
{
    public class DroidNavigator : INavigator<Activity>
    {
        public ReactiveViewModel CurrenViewModel { get; private set; }

        public async Task<TViewModel> RedirectTo<TViewModel>(Action<TViewModel> initViewAction = null,
            bool removeFromHistory = false) where TViewModel : ReactiveViewModel
        {
            if (PlatformNavigationController == null)
                throw new NullReferenceException("PlatformNavigationController == null");

            var newVm = ApplicationFacade.Facade.Resolver.CreateObject<TViewModel>();
            newVm?.Initialize();
            initViewAction?.Invoke(newVm);

            var typedPage = ApplicationFacade.Facade.Resolver.ResolveMappedType<TViewModel>();
            if (!typedPage.HasValue) return null;

            var typedPageValue = typedPage.Value;
            if (typedPageValue.ContentPage.IsSubclassOf(typeof(Fragment)))
            {
                if (typedPageValue.ParentPage == PlatformNavigationController.GetType())
                    ChangeMainFragment(typedPageValue.ContentPage);
                else
                {
                    ChangeActivity(removeFromHistory, typedPageValue.ParentPage);
                    await Task.Delay(1000);
                    ChangeMainFragment(typedPageValue.ContentPage);
                }
            }
            else if (typedPageValue.ContentPage.IsSubclassOf(typeof(Activity)))
            {
                ChangeActivity(removeFromHistory, typedPageValue.ContentPage);
            }

            CurrenViewModel = newVm;
            return await Task.FromResult(newVm);
        }

        private void ChangeMainFragment(Type pageType)
        {
            if (PlatformNavigationController is IFragmentKeeper fragmentKeeper)
            {
                var tran = PlatformNavigationController.FragmentManager.BeginTransaction();
                // TODO: need implement fragment manager here.
                var fragment = (Fragment) ApplicationFacade.Facade.Resolver.CreateObject(pageType);
                tran.Add(fragmentKeeper.MainFragmentContainerId, fragment);
                tran.Commit();
            }
        }

        private void ChangeActivity(bool removeFromHistory,Type pageType)
        {
            var newActivity = new Intent(PlatformNavigationController, pageType);

            PlatformNavigationController.StartActivity(newActivity);
            if (removeFromHistory)
                PlatformNavigationController.Finish();
        }

        public Task ShowErrorMessage(string s)
        {
            Toast.MakeText(PlatformNavigationController, s, ToastLength.Short).Show();
            return Task.CompletedTask;
        }

        public Activity PlatformNavigationController { get; set; }
    }
}
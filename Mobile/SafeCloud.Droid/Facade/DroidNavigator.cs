using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using MkCoreLibrary.PlatformManagement.Core;
using MkCoreLibrary.PlatformManagement.Infrastructure;
using MkCoreLibrary.ViewModels;
using ReactiveUI;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Facade
{
    public class DroidNavigator : INavigator<Activity>
    {
        public ReactiveMainViewModel MainViewModel { get; private set; }
        public ReactiveViewModel CurrenViewModel { get; private set; }

        public IMessageController MessageController =>
            ApplicationFacade.Facade.Resolver.Resolve<IMessageController<Activity>>(controller =>
                controller.PlatformMessageController = NavigationController);

        public async Task PushToViewWithPartialView<TViewModel1, TViewModel2>(Action<TViewModel1> initViewAction1 = null, Action<TViewModel2> initViewAction2 = null, bool removeFromHistory = false) where TViewModel1 : ReactiveMainViewModel where TViewModel2 : ReactiveViewModel
        {
            await PushToView(initViewAction1, removeFromHistory);
            await PushToPartialView(initViewAction2);
        }

        public async Task PushToView<TViewModel>(Action<TViewModel> initViewAction = null, bool removeFromHistory = false) where TViewModel : ReactiveMainViewModel
        {
            TViewModel newVm = await ResolveViewModel(initViewAction, removeFromHistory);

            if (NavigationController is IViewFor<TViewModel> activity)
            {
                activity.ViewModel = newVm;
                CurrenViewModel = null;
                MainViewModel = newVm;
            }
            else await ShowErrorMessage("MainViewModel is not match to Activity");
        }

        private async Task<TViewModel> ResolveViewModel<TViewModel>(Action<TViewModel> initViewAction, bool removeFromHistory) where TViewModel : ReactiveMainViewModel
        {
            ResolveView(initViewAction, out var newVm, out var typedPage);
            await ChangeActivity(removeFromHistory, typedPage);
            return newVm;
        }

        public async Task PushToPartialView<TViewModel>(Action<TViewModel> initViewAction = null)
            where TViewModel : ReactiveViewModel
        {
            ResolveView(initViewAction, out var newVm, out var typedPage);
            var fragment = ChangeMainFragment(typedPage);
            if (fragment is IViewFor viewFor)
            {
                viewFor.ViewModel = newVm;
                CurrenViewModel = newVm;
                MainViewModel.SetInnerViewModel(CurrenViewModel);
            }
            else await ShowErrorMessage("CurrenViewModel is not match to Fragment");
        }

        private void ResolveView<TViewModel>(Action<TViewModel> initViewAction, out TViewModel newVm, out Type typedPage) where TViewModel : ReactiveViewModel
        {
            if (NavigationController == null)
                throw new NullReferenceException("NavigationController == null");

            newVm = CreateVm(initViewAction);
            typedPage = ApplicationFacade.Facade.Resolver.ResolveMappedType<TViewModel>();

            if (newVm is INavigatedObject navigatedObject)
                navigatedObject.Navigator = this;
        }

        private static TViewModel CreateVm<TViewModel>(Action<TViewModel> initViewAction) where TViewModel : ReactiveViewModel
        {
            var newVm = ApplicationFacade.Facade.Resolver.CreateObject<TViewModel>();
            newVm?.Initialize();
            initViewAction?.Invoke(newVm);
            return newVm;
        }

        private Fragment ChangeMainFragment(Type pageType)
        {
            if (NavigationController is IFragmentKeeper fragmentKeeper)
            {
                var tran = NavigationController.FragmentManager.BeginTransaction();
                var fragment = (Fragment) ApplicationFacade.Facade.Resolver.CreateObject(pageType);
                tran.Replace(fragmentKeeper.MainFragmentContainerId, fragment);
                tran.Commit();
                return fragment;
            }
            return null;
        }

        private async Task ChangeActivity(bool removeFromHistory,Type pageType)
        {
            var newActivity = new Intent(NavigationController, pageType);
            NavigationController.StartActivity(newActivity);
            if (removeFromHistory)
                NavigationController.Finish();
            await Task.Delay(300);
        }

        public async Task ShowErrorMessage(string s)
        {
            await MessageController.ShowPopupMessage(s);
        }

        public Activity NavigationController { get; set; }
    }
}
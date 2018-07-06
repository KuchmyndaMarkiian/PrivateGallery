using System;
using System.Threading.Tasks;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.MVVM.ViewModels;

namespace SafeCloud.ClientCore.Infrastructure
{
    public interface INavigator
    {
        ReactiveNavigatedViewModel MainViewModel { get; }
        ReactiveViewModel CurrenViewModel { get; }

        Task PushToViewWithPartialView<TViewModel1, TViewModel2>(
            Action<TViewModel1> initViewAction1 = null,
            Action<TViewModel2> initViewAction2 = null, 
            bool removeFromHistory = false)
            where TViewModel1 : ReactiveNavigatedViewModel where TViewModel2 : ReactiveViewModel;
        Task PushToView<TViewModel>(Action<TViewModel> initViewAction = null , bool removeFromHistory = false) where TViewModel : ReactiveNavigatedViewModel;
        Task PushToPartialView<TViewModel>(Action<TViewModel> initViewAction = null) where TViewModel : ReactiveViewModel;
        Task ShowErrorMessage(string s);
    }
    public interface INavigator<TPlatformController> : INavigator
    {
        TPlatformController PlatformNavigationController { get; set; }
    }
}

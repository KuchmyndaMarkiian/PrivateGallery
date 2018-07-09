using System;
using System.Threading.Tasks;
using MkCoreLibrary.PlatformManagement.Core;
using MkCoreLibrary.ViewModels;

namespace MkCoreLibrary.PlatformManagement.Infrastructure
{
    public interface INavigator
    {
        ReactiveMainViewModel MainViewModel { get; }
        ReactiveViewModel CurrenViewModel { get; }
        IMessageController MessageController { get; }
        Task PushToViewWithPartialView<TViewModel1, TViewModel2>(
            Action<TViewModel1> initViewAction1 = null,
            Action<TViewModel2> initViewAction2 = null, 
            bool removeFromHistory = false)
            where TViewModel1 : ReactiveMainViewModel where TViewModel2 : ReactiveViewModel;
        Task PushToView<TViewModel>(Action<TViewModel> initViewAction = null , bool removeFromHistory = false) where TViewModel : ReactiveMainViewModel;
        Task PushToPartialView<TViewModel>(Action<TViewModel> initViewAction = null) where TViewModel : ReactiveViewModel;
        Task ShowErrorMessage(string s);
    }
    public interface INavigator<TPlatformController> : INavigator
    {
        TPlatformController NavigationController { get; set; }
    }

    public interface INavigatedObject
    {
        INavigator Navigator { get; set; }
    }
}

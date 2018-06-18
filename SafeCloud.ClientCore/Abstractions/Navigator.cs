using System;
using System.Threading.Tasks;

namespace SafeCloud.ClientCore.Abstractions
{
    public interface INavigator
    {
        ReactiveViewModel CurrenViewModel { get;}
        Task<TViewModel> RedirectTo<TViewModel>(Action<TViewModel> initViewAction = null , bool removeFromHistory = false) where TViewModel : ReactiveViewModel;
        Task ShowErrorMessage(string s);
    }
    public interface INavigator<TPlatformController> : INavigator
    {
        TPlatformController PlatformNavigationController { get; set; }
    }
}

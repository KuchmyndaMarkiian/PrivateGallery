using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.Infrastructure
{
    public interface INavigator
    {
        ReactiveViewModel CurrenViewModel { get; }
        Task<TViewModel> RedirectTo<TViewModel>(Action<TViewModel> initViewAction = null , bool removeFromHistory = false) where TViewModel : ReactiveViewModel;
        Task ShowErrorMessage(string s);
    }
    public interface INavigator<TPlatformController> : INavigator
    {
        TPlatformController PlatformNavigationController { get; set; }
    }
}

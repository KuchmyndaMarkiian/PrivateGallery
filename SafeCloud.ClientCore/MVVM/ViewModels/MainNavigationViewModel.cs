using System.Windows.Input;
using MkCoreLibrary.PlatformManagement.Core;
using ReactiveUI;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels.Debug;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class MainNavigationViewModel : ReactiveMainViewModel
    {
        public ICommand DebugPageCommand => ReactiveCommand.CreateFromTask(async () =>
        {
            await ApplicationFacade.Facade.Navigator.PushToPartialView<DebugViewModel>();
        });
        public ICommand SettingsPageCommand => ReactiveCommand.CreateFromTask(async () =>
        {
            await ApplicationFacade.Facade.Navigator.PushToPartialView<SettingsViewModel>();
        });
    }
}

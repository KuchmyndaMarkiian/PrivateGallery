using System.Windows.Input;
using MkCoreLibrary.ViewModels;
using ReactiveUI;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class MainNavigationViewModel : ReactiveNavigatedViewModel
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

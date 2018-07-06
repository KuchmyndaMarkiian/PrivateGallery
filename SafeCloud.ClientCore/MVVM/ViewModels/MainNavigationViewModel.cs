using System.Windows.Input;
using ReactiveUI;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class MainNavigationViewModel : ReactiveNavigatedViewModel
    {
        public override void Initialize()
        {
        }

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

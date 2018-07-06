using System.Windows.Input;
using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class MainNavigationViewModel : ReactiveViewModel, IInnerViewModelKeeper
    {
        public override void Initialize()
        {
        }

        public ICommand DebugPageCommand => ReactiveCommand.CreateFromTask(async () =>
        {
            await ApplicationFacade.Facade.Navigator.RedirectTo<DebugViewModel>();
        });
        public ICommand SettingsPageCommand => ReactiveCommand.CreateFromTask(async () =>
        {
            await ApplicationFacade.Facade.Navigator.RedirectTo<SettingsViewModel>();
        });

        public ReactiveViewModel InnerViewModel { get; set; }
    }
}

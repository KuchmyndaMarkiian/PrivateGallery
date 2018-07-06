using System.Threading.Tasks;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels.Debug;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class MainNavigationViewModel : ReactiveViewModel
    {
        public override void Initialize()
        {
        }

        public async Task GoToDebugPage()
        {
            await ApplicationFacade.Facade.Navigator.RedirectTo<DebugViewModel>();
        }
    }
}

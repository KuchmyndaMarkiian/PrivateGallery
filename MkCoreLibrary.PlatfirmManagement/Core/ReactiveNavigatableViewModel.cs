using MkCoreLibrary.PlatformManagement.Infrastructure;
using MkCoreLibrary.ViewModels;

namespace MkCoreLibrary.PlatformManagement.Core
{
    public abstract class ReactiveNavigatableViewModel : ReactiveViewModel, INavigatedObject
    {
        public INavigator Navigator { get; set; }
    }
}

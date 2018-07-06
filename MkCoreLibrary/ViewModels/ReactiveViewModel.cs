using ReactiveUI;

namespace MkCoreLibrary.ViewModels
{
    public abstract class ReactiveViewModel : ReactiveObject, ISupportsActivation
    {
        public ViewModelActivator Activator { get; } = new ViewModelActivator();
        public virtual void Initialize() => Activator.Activate();
    }
}
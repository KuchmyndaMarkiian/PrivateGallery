using ReactiveUI;

namespace SafeCloud.ClientCore.Abstractions.ViewModel
{
    public abstract class ReactiveViewModel : ReactiveObject, ISupportsActivation
    {
        ViewModelActivator ISupportsActivation.Activator { get; } = new ViewModelActivator();
        public abstract void Initialize();
    }
}
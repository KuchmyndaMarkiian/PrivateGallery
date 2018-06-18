using ReactiveUI;

namespace SafeCloud.ClientCore.Abstractions
{
    public abstract class ReactiveModel : ReactiveObject, ISupportsActivation
    {
        ViewModelActivator ISupportsActivation.Activator { get; } = new ViewModelActivator();
        public abstract void Initialize();
    }

    public abstract class ReactiveViewModel : ReactiveModel
    {
    }
}
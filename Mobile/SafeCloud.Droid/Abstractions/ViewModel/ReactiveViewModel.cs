using ReactiveUI;

namespace SafeCloud.Droid.Abstractions.ViewModel
{
    public abstract class ReactiveViewModel : ReactiveObject, ISupportsActivation
    {
        ViewModelActivator ISupportsActivation.Activator { get; } = new ViewModelActivator();
        public abstract void Init();
    }
}
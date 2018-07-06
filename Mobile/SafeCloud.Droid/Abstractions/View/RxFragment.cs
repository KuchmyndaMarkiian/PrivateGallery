using ReactiveUI;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.Droid.Facade;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class RxFragment<TViewModel> : ReactiveFragment<TViewModel> where TViewModel : ReactiveViewModel
    {
        public virtual void Initialize()
        {
            BindProperties();
            BindCommands();
        }
        
        protected virtual void BindProperties() { }
        protected virtual void BindCommands() { }
    }
}
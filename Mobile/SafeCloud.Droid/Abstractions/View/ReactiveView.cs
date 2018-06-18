using Android.OS;
using ReactiveUI;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class ReactiveView<TViewModel> : ReactiveActivity<TViewModel> where TViewModel : class
    {
        public abstract void Initialize();

        protected override void OnCreate(Bundle savedInstanceState)
        {
            BindProperties();
            base.OnCreate(savedInstanceState);
            Initialize();
            BindCommands();
        }

        protected abstract void BindProperties();
        protected abstract void BindCommands();
    }
}
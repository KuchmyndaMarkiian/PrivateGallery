using Android.OS;
using ReactiveUI;

namespace SafeCloud.Droid.Abstractions.View
{
    public abstract class ReactiveView<T> : ReactiveActivity<T> where T : class
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            //this.WireUpControls(ControlFetcherMixin.ResolveStrategy.Implicit);
        }
    }
}
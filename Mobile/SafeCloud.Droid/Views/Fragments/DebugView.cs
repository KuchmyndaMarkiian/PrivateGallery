using Android.OS;
using Android.Views;
using Android.Widget;
using ReactiveUI;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views.Fragments
{
    public class DebugView : RxFragment<DebugViewModel>
    {
        private View currentView;
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            currentView = inflater.Inflate(Resource.Layout.DebugView, container, false);
            Initialize();
            // Use this to return your custom view for this Fragment
            return currentView;
        }

        protected override void BindCommands()
        {
            base.BindCommands();

            this.BindCommand(ViewModel, x => x.ShowToastTest, x => x.DebugToastButton);
        }

        public Button DebugToastButton => currentView.GetControl<Button>();
    }
}
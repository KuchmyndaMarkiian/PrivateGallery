using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using MkCoreLibrary.PlatformManagement.Infrastructure;
using ReactiveUI;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    public class SettingsView : RxFragment<SettingsViewModel>
    {
        private View currentView;
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            // Use this to return your custom view for this Fragment
            currentView = inflater.Inflate(Resource.Layout.Settings, container, false);
            Initialize();
            return currentView;
        }

        public override void Initialize()
        {
            base.Initialize();

            ViewModel.Storage = ApplicationFacade.Facade.Resolver.Resolve<IKeyValuePairStorage<Activity>>(storage =>
                storage.PlatformController = Activity);
        }

        protected override void BindProperties()
        {
            base.BindProperties();
            this.Bind(ViewModel, x => x.SettingModel.ServerUri, x => x.ServerEditView.Text);
        }

        protected override void BindCommands()
        {
            base.BindCommands();
            this.BindCommand(ViewModel, x => x.SaveCommand, x => x.SaveButton);
        }

        public EditText ServerEditView => currentView.GetControl<EditText>();
        public Button SaveButton => currentView.GetControl<Button>();
    }
}
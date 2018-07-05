using Android.App;
using Android.OS;
using Android.Widget;
using ReactiveUI;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.ViewModels;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "SafeCloud", MainLauncher = true, NoHistory = true, Theme = "@style/LauncherTheme")]
    public class SettingsView : ReactiveView<SettingsViewModel>
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            ViewModelReassignation = model =>
                model.Storage =
                    ApplicationFacade.Facade.Resolver.Resolve<IKeyValuePairStorage<Activity>>(storage =>
                        storage.PlatformObject = this);
            SetContentView(Resource.Layout.Settings);
            base.OnCreate(savedInstanceState);
        }

        protected override void BindProperties()
        {
            base.BindProperties();

            this.Bind(ViewModel, x => x.SettingModel.HostUri, x => x.ServerEditView.Text);
        }

        protected override void BindCommands()
        {
            base.BindCommands();

            this.BindCommand(ViewModel, x => x.SaveCommand, x => x.SaveButton);
        }

        public EditText ServerEditView => this.GetControl<EditText>();
        public Button SaveButton => this.GetControl<Button>();
    }
}
using Android.App;
using Android.OS;
using Android.Widget;
using ReactiveUI;
using SafeCloud.ClientCore.MVVM.ViewModels.AuthStructure;
using SafeCloud.Droid.Abstractions.View;

namespace SafeCloud.Droid.Views
{
    [Activity(Label = "AuthorizationView")]
    public class AuthorizationView : ReactiveView<AuthorizationViewModel>
    {
        public override void Initialize()
        {
            ViewModel?.Initialize();
        }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            SetContentView(Resource.Layout.Authorization);

            ViewModel = new AuthorizationViewModel();

            base.OnCreate(savedInstanceState);
        }

        protected override void BindProperties()
        {
            this.Bind(ViewModel, x => x.LoginModel.Login, x => x.LoginEditView.Text);
            this.Bind(ViewModel, x => x.LoginModel.Password, x => x.PasswordEditView.Text);
            
        }

        protected override void BindCommands()
        {
            this.BindCommand(ViewModel, x => x.LoginCommand, x => x.LoginButton);
        }


        public EditText LoginEditView => this.GetControl<EditText>();
        public EditText PasswordEditView => this.GetControl<EditText>();
        public Button LoginButton => this.GetControl<Button>();
    }
}
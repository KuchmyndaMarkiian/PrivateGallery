using System.Threading.Tasks;
using Android.App;
using Android.OS;
using Android.Widget;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Views.Fragments;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/Theme.Custom")]
    public class ForgotPasswordScreen : Activity
    {
        private RestorePasswordBindingModel _model = new RestorePasswordBindingModel();
        private Button _mainButton;
        private RestorePasswordFragment _restorePasswordFragment;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.ForgotPasswordScreen);
            // Create your application here

            #region Init UI

            _restorePasswordFragment = new RestorePasswordFragment(_model, Action, this);
            _mainButton = FindViewById<Button>(Resource.Id.restorePasswordButton);
            _mainButton.Click += ShowDialogWindow;
            _mainButton.Enabled = false;
            FindViewById<EditText>(Resource.Id.emailForRestoringPassword).AfterTextChanged +=
                (sender, args) =>
                {
                    _model.Email = ((EditText) sender).Text;
                    _mainButton.Enabled = !string.IsNullOrEmpty(_model.Email);
                };

            #endregion
        }

        /// <summary>
        /// Restore password executing
        /// </summary>
        /// <param name="dialog"></param>
        /// <param name="dialogFragment"></param>
        private async void Action(Dialog dialog, DialogFragment dialogFragment)
        {
            await Task.Run(() =>
            {
                using (var service = new AutorizationService())
                {
                    service.RestorePassword(_model);
                    var isSuccessful = service.IsSuccessful();
                    dialog.Dismiss();
                    Toast.MakeText(this, isSuccessful ? "Password is restored" : service.GetMessage(),
                            ToastLength.Short)
                        .Show();
                    dialogFragment.Dismiss();
                    if (isSuccessful)
                    {
                        MoveTaskToBack(true);
                        Finish();
                    }
                }
            });
        }

        private void ShowDialogWindow(object sender, System.EventArgs e)
        {
            _restorePasswordFragment.Show(FragmentManager, nameof(RestorePasswordFragment));
        }
    }
}
using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using PrivateGallery.Helpers;
using PrivateGallery.Infrastructure;
using PrivateGallery.Models;

namespace PrivateGallery.Activities
{
    [Activity(Label = "Anonymous Gallery", MainLauncher = true, Theme = "@style/NoActionBar")]
    public class LoginScreen : Activity
    {
        EditText _loginView;
        EditText _passwordView;
        UserAccount _userAccount=UserAccount.Instance;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.LoginScreen);
            // Create your application here

            #region Buttons init

            var registerButton = FindViewById<Button>(Resource.Id.registerButton);
            registerButton.Click += OnRegisterButtonOnClick;
            var signInButton = FindViewById<Button>(Resource.Id.signIn);
            signInButton.Click += OnSignInButtonOnClick;

            #endregion

            #region Textviews init

            
            _loginView = FindViewById<EditText>(Resource.Id.loginView);
            _passwordView = FindViewById<EditText>(Resource.Id.passwordView);
            _loginView.AfterTextChanged += (sender, args) => _userAccount.Email = (sender as EditText).Text;
            _passwordView.AfterTextChanged += (sender, args) => _userAccount.Password = (sender as EditText).Text;
            #endregion
        }

        #region Autorization

         private void OnSignInButtonOnClick(object o, EventArgs eventArgs)
        {
            var loadingDialog= new Dialog(this);
            loadingDialog.InitializeLoadingDialog();
            Task.Run(async () =>
            {
                using (var service = new AutorizationService())
                {
                    service.SignIn(ref _userAccount);
                    if (service.IsSuccessful())
                    {
                        using (HttpManager manager = new HttpManager(Settings.Instance.ServerAdress))
                        {
                            manager.AccessToken = _userAccount.UserToken.AccessToken;
                            _userAccount =
                                (UserAccount) await manager.GetData<AccountInfoViewModel>(Settings.Instance.UserInfo);
                        }
                        RunOnUiThread(() => loadingDialog.Dismiss());
                    }
                }
            });
        }
        void OnRegisterButtonOnClick(object sender, EventArgs args)
        {
            var intent = new Intent(this, typeof(RegistrationScreen));
            StartActivity(intent);
            Finish();
        }

        #endregion
    }
}
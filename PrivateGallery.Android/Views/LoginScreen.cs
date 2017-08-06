using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Models;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", MainLauncher = true, Theme = "@style/Theme.Custom")]
    public class LoginScreen : Activity
    {
        private UserAccount _userAccount;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.LoginScreen);
            // Create your application here
            _userAccount =UserAccount.Instance;
            #region Buttons init

            var registerButton = FindViewById<Button>(Resource.Id.registerButton);
            registerButton.Click += OnRegisterButtonOnClick;
            var signInButton = FindViewById<Button>(Resource.Id.signIn);
            signInButton.Click += OnSignInButtonOnClick;
            var forgotPasswordLabel = FindViewById<TextView>(Resource.Id.forgotPasswordLabel);
            forgotPasswordLabel.Clickable = true;
            forgotPasswordLabel.Click += (sender, args) =>
            {
                Intent intent=new Intent(this,typeof(ForgotPasswordScreen));
                StartActivity(intent);
            };
            #endregion

            #region Textviews init

            
            var loginView = FindViewById<EditText>(Resource.Id.loginView);
            var passwordView = FindViewById<EditText>(Resource.Id.passwordView);
            loginView.AfterTextChanged += (sender, args) => _userAccount.Email = (sender as EditText).Text;
            passwordView.AfterTextChanged += (sender, args) => _userAccount.Password = (sender as EditText).Text;
            #endregion
        }

        #region Autorization

         private void OnSignInButtonOnClick(object o, EventArgs eventArgs)
        {
            var loadingDialog= new Dialog(this);
            loadingDialog.InitializeLoadingDialog();
            loadingDialog.Show();
            Task.Run(async () =>
            {
                using (var service = new AutorizationService())
                {
                    service.SignIn(ref _userAccount);
                    if (service.IsSuccessful())
                    {
                        using (HttpManager manager = new HttpManager(Settings.ServerAdress))
                        {
                            manager.AccessToken = _userAccount.UserToken.AccessToken;
                            _userAccount.Clone(await manager.GetData<AccountInfoViewModel>(Settings.UserInfo));
                        }
                        RunOnUiThread(() =>
                        {
                            loadingDialog.Dismiss();
                            var main = new Intent(this, typeof(MainScreen));
                            StartActivity(main);
                            Finish();
                        });
                    }
                    else
                    {
                        RunOnUiThread(() => Toast.MakeText(this,"Signing in isn`t executed.",ToastLength.Short).Show());
                    }
                }
                RunOnUiThread(() => loadingDialog.Dismiss());
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
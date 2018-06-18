using ReactiveUI;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.Abstractions.Infrastructure;
using SafeCloud.ClientCore.Abstractions.ViewModel;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.Models.Auth;

namespace SafeCloud.ClientCore.MVVM.ViewModels.AuthStructure
{
    public class AuthorizationViewModel : ReactiveModel
    {
        public override void Initialize()
        {
            LoginModel = new LoginModel();
            LoginModel.Initialize();

            LoginCommand = ReactiveCommand.CreateFromTask(async () =>
            {
                var request = new
                {
                    grant_type = "password",
                    username = LoginModel.Login,
                    password = LoginModel.Password
                };

                IRestClient client = new RestClient();
                await client.Post("http://192.168.10.187:57641/Token", null, request, ContentType.Form,
                    async message => System.Console.WriteLine(await message.Content.ReadAsStringAsync()),
                    async message => System.Console.WriteLine(await message.Content.ReadAsStringAsync()));
            });
        }

        [Reactive]
        public LoginModel LoginModel { get; set; }

        public ReactiveCommand LoginCommand { get; set; }
    }
}
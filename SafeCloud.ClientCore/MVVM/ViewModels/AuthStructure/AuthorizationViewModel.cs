using System;
using System.Windows.Input;
using MkCoreLibrary.Infrastructure;
using MkCoreLibrary.PlatformManagement.Core;
using MkCoreLibrary.ViewModels;
using ReactiveUI;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.Models;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{ 
    public class AuthorizationViewModel : ReactiveNavigatableViewModel
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
                    async message =>
                    {
                        Console.WriteLine($"{message.StatusCode}:{await message.Content.ReadAsStringAsync()}");

                        await ApplicationFacade.Facade.Navigator.PushToViewWithPartialView<MainNavigationViewModel, FileListViewModel>();
                    },
                    async message =>
                    {
                        Console.WriteLine($"{message.StatusCode}:{await message.Content.ReadAsStringAsync()}");

                        await ApplicationFacade.Facade.Navigator.ShowErrorMessage($"{message.StatusCode}:{await message.Content.ReadAsStringAsync()}");
                    });
            });
        }

        [Reactive]
        public LoginModel LoginModel { get; set; }

        public ICommand LoginCommand { get; set; }
    }
}
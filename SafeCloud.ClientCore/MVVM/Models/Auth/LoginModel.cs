using System;
using System.Linq;
using MkCoreLibrary.ViewModels;
using ReactiveUI;
using ReactiveUI.Fody.Helpers;

namespace SafeCloud.ClientCore.MVVM.Models
{
    public class LoginModel : ReactiveViewModel
    {
        public LoginModel()
        {
            this.WhenActivated(action => action(this.WhenAnyValue(x => x.Login, x => x.Password,
                    (login, password) => $"{login}({string.Join("", password.Select(x => "*"))})")
                .Subscribe(s => FullContent = s)));
        }
        

        [Reactive]
        public string Login { get; set; } = "";

        [Reactive]
        public string Password { get; set; } = "";

        [Reactive]
        public string FullContent { get; set; }

        public override void Initialize()
        {
            Activator.Activate();
        }
    }
}

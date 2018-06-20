using System;
using System.Linq;
using System.Threading.Tasks;
using ReactiveUI;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.MVVM.Models.Auth
{
    public class LoginModel : ReactiveViewModel
    {
        public override void Initialize() => this.WhenAnyValue(x => x.Login, x => x.Password,
                (login, password) => $"{login}({string.Join("", password.Select(x => "*"))})")
            .Subscribe(s => FullContent = s);

        [Reactive]
        public string Login { get; set; } = "";

        [Reactive]
        public string Password { get; set; } = "";

        [Reactive]
        public string FullContent { get; set; }
    }
}

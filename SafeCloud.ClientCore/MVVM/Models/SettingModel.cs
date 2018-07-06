using MkCoreLibrary.ViewModels;
using Newtonsoft.Json;
using ReactiveUI.Fody.Helpers;

namespace SafeCloud.ClientCore.MVVM.Models
{
    public class SettingModel : ReactiveViewModel
    {
        [Reactive, JsonProperty("ServerUri")]
        public string ServerUri { get; set; } = "http://localhost:57641/";
    }
}

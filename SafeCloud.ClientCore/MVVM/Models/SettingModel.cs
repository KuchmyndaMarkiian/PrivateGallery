using Newtonsoft.Json;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.MVVM.Models
{
    public class SettingModel : ReactiveViewModel
    {
        [Reactive, JsonProperty("ServerUri")]
        public string ServerUri { get; set; } = "http://localhost:57641/";
        public override void Initialize()
        {
            
        }
    }
}

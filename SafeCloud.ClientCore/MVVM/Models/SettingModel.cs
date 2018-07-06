
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.MVVM.Models
{
    public class SettingModel : ReactiveModel
    {
        [Reactive, JsonProperty("ServerUri")]
        public string HostUri { get; set; } = "http://localhost:57641/";
        public override void Initialize()
        {
            
        }
    }
}

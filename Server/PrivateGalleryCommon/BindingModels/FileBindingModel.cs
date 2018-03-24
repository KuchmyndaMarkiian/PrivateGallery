using System.ComponentModel.DataAnnotations;
using System.IO;

namespace SafeCloud.Common.BindingModels
{
    public class FileBindingModel:FolderBindindModel
    {
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty geolocation for creating object", MinimumLength = 1)]
        public string Geolocation { get; set; }
        public long Size { get; set; }
        [Newtonsoft.Json.JsonIgnore]
        public Stream Content { get; set; }
    }
}
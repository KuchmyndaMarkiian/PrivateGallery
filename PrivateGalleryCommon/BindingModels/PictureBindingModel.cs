using System.ComponentModel.DataAnnotations;
using System.IO;

namespace PrivateGallery.Common.BindingModels
{
    public class PictureBindingModel:GalleryBindindModel
    {
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty geolocation for creating object", MinimumLength = 1)]
        public string Geolocation { get; set; }
        [Newtonsoft.Json.JsonIgnore]
        public Stream Content { get; set; }
    }
}
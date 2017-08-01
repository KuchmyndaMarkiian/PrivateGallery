using System.ComponentModel.DataAnnotations;

namespace PrivateGallery.Common.BindingModels
{
    public class PictureBindingModel:GalleryBindindModel
    {
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty description for creating object", MinimumLength = 1)]
        public string Description { get; set; }
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty geolocation for creating object", MinimumLength = 1)]
        public string Geolocation { get; set; }
        public string GalleryName { get; set; }
    }
}
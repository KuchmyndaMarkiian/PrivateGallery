using System;
using System.ComponentModel.DataAnnotations;

namespace PrivateGallery.Common.BindingModels
{
    public class GalleryBindindModel
    {
        [Microsoft.Build.Framework.Required]
        [StringLength(100,ErrorMessage = "Empty header for creating gallery",MinimumLength = 1)]
        public string Name { get; set; }
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty header for creating gallery", MinimumLength = 1)]
        public string NewName { get; set; }
        [Microsoft.Build.Framework.Required]
        public DateTime DateTime { get; set; }
    }
}

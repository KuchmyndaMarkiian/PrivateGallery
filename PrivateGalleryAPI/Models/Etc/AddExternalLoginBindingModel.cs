using System.ComponentModel.DataAnnotations;

namespace PrivateGalleryAPI.Models
{
    public class AddExternalLoginBindingModel
    {
        [Required]
        [Display(Name = "Внешний маркер доступа")]
        public string ExternalAccessToken { get; set; }
    }
}
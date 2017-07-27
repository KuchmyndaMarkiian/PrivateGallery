using System.ComponentModel.DataAnnotations;

namespace PrivateGalleryAPI.Models
{
    public class RegisterExternalBindingModel
    {
        [Required]
        [Display(Name = "Адрес электронной почты")]
        public string Email { get; set; }
    }
}
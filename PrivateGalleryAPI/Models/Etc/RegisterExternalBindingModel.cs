using System.ComponentModel.DataAnnotations;

namespace SafeCloud.API.Models.Etc
{
    public class RegisterExternalBindingModel
    {
        [Required]
        [Display(Name = "Адрес электронной почты")]
        public string Email { get; set; }
    }
}
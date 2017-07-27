using System.ComponentModel.DataAnnotations;

namespace PrivateGallery.Common.BindingModels
{
    public class RegisterBindingModel
    {
        [Microsoft.Build.Framework.Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Microsoft.Build.Framework.Required]
        [Display(Name = "Last Namel")]
        public string LastName { get; set; }

        [Microsoft.Build.Framework.Required]
        [Display(Name = "E-mail")]
        public string Email { get; set; }

        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "The value {0} must contain at least {2} characters.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("Password", ErrorMessage = "The password and its confirmation do not match.")]
        public string ConfirmPassword { get; set; }
    }
}
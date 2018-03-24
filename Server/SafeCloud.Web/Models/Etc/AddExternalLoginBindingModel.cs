using System.ComponentModel.DataAnnotations;

namespace SafeCloud.Web.Models.Etc
{
    public class AddExternalLoginBindingModel
    {
        [Required]
        [Display(Name = "Внешний маркер доступа")]
        public string ExternalAccessToken { get; set; }
    }
}
using System.ComponentModel.DataAnnotations;

namespace SafeCloud.API.Models.Etc
{
    public class AddExternalLoginBindingModel
    {
        [Required]
        [Display(Name = "������� ������ �������")]
        public string ExternalAccessToken { get; set; }
    }
}
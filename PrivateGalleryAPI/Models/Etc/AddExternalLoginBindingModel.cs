using System.ComponentModel.DataAnnotations;

namespace PrivateGalleryAPI.Models
{
    public class AddExternalLoginBindingModel
    {
        [Required]
        [Display(Name = "������� ������ �������")]
        public string ExternalAccessToken { get; set; }
    }
}
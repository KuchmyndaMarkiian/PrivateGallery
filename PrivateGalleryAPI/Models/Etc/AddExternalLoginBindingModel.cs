using System.ComponentModel.DataAnnotations;

namespace PrivateGalleryAPI.Models.Etc
{
    public class AddExternalLoginBindingModel
    {
        [Required]
        [Display(Name = "������� ������ �������")]
        public string ExternalAccessToken { get; set; }
    }
}
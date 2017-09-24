using System.ComponentModel.DataAnnotations;

namespace SafeCloud.API.Models.Etc
{
    public class RemoveLoginBindingModel
    {
        [Required]
        [Display(Name = "��������� �����")]
        public string LoginProvider { get; set; }

        [Required]
        [Display(Name = "���� ����������")]
        public string ProviderKey { get; set; }
    }
}
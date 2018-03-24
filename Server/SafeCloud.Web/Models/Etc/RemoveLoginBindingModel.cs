using System.ComponentModel.DataAnnotations;

namespace SafeCloud.Web.Models.Etc
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
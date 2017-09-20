using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PrivateGallery.DAL.Entities
{
    public class Attribute
    {
        [Key]
        public int Id { get; set; }
        public bool HasPublicAccess { get; set; } = false;
    }
}

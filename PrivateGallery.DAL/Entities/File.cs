using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PrivateGallery.DAL.Entities
{
    public class File
    {
        [Key, Index(IsUnique = true)]
        public string Id { get; set; }

        public string Header { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }

        [Required]
        public virtual Attribute Attribute { get; set; } = new Attribute();
        public string Path { get; set; }
        public string Geolocation { get; set; }
        //[Required
        public virtual Folder ParentFolder { get; set; }
    }
}

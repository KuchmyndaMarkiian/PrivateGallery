using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PrivateGallery.DAL.Entities
{
    public class FileStructure
    {
        [Key,Index(IsClustered = false)]
        public int Id { get; set; }

        public string Header { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }

        [Required]
        public Attribute Attribute { get; set; } = new Attribute();

        public string Path { get; set; }
        public string Geolocation { get; set; }
        //[Required
        [Index(IsClustered = true,Order = 2)]
        public virtual Folder Folder { get; set; }
        [Required]
        public virtual User OwnerUser { get; set; }
        public virtual List<File> Files { get; set; } = new List<File>();
    }
}

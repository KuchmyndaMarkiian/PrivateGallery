using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SafeCloud.DAL.Entities
{
    public class File
    {
        [Key, Index(IsUnique = true)]
        public string Id { get; set; }

        public string Header { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }

        public bool AttributeHasPublicAccess { get; set; } = false;
        public long Size { get; set; } = 0;
        public string Path { get; set; }
        public string Geolocation { get; set; }
        public virtual User OwnerUser { get; set; }
        public virtual Folder ParentFolder { get; set; }
    }
}

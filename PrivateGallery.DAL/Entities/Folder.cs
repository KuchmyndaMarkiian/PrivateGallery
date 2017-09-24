

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SafeCloud.DAL.Entities
{
    public class Folder
    {
        [Key, Index(IsUnique = true)]
        public string  Id { get; set; }

        public string Header { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }

        public bool AttributeHasPublicAccess { get; set; } = false;

        [Required]
        public virtual User OwnerUser { get; set; }
        public virtual List<File> Files { get; set; } = new List<File>();
        public virtual Folder ParentFolder { get; set; }

    }
}

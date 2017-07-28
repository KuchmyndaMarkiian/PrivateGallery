using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PrivateGallery.DAL.Entities
{
    public class Gallery
    {
        [Key]
        public int Id { get; set; }
        public string Header { get; set; }
        public DateTime? CreatedDate { get; set; }
        [Required]
        public virtual  User OwnerUser { get; set; }
        public virtual  List<Photo> Photos { get; set; }=new List<Photo>();
    }
}

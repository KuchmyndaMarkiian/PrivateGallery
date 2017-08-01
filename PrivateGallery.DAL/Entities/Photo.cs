using System;
using System.ComponentModel.DataAnnotations;

namespace PrivateGallery.DAL.Entities
{
    public class Photo
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
        public string Description { get; set; }
        public string Geolocation { get; set; }
        public DateTime? CreatedDate { get; set; }
        [Required]
        public virtual Gallery Folder { get; set; }
    }
}

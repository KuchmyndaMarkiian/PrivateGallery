using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Contexts
{
    public class PrivateGalleryDbContext : IdentityDbContext<User>
    {
        public PrivateGalleryDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static PrivateGalleryDbContext Create()
        {
            return new PrivateGalleryDbContext();
        }

        public virtual DbSet<Gallery> Galleries { get; set; }
        public virtual DbSet<Photo> Photos { get; set; }
    }
}

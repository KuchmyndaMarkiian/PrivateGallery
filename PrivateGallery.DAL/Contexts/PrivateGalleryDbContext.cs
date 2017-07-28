using System.ComponentModel.DataAnnotations.Schema;
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

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Gallery>()
                .Property(gallery => gallery.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            modelBuilder.Entity<Photo>()
                .Property(photo => photo.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            modelBuilder.Entity<User>().HasMany(u => u.Galleries).WithRequired(g => g.OwnerUser);
            modelBuilder.Entity<Gallery>().HasMany(u => u.Photos).WithRequired(g => g.Folder);

        }
    }
}

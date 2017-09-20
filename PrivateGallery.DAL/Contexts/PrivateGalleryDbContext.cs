using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Contexts
{
    public class PrivateGalleryDbContext : IdentityDbContext<User>
    {
        public PrivateGalleryDbContext()
            : base("StandartConnection", throwIfV1Schema: false)
        {
        }
        public static PrivateGalleryDbContext Create()
        {
            return new PrivateGalleryDbContext();
        }
        public virtual DbSet<Folder> Folders { get; set; }
        public virtual DbSet<File> Files { get; set; }
        public virtual DbSet<Attribute> Attributes { get; set; }
        /// <summary>
        /// Setting relationships with entities
        /// </summary>
        /// <param name="modelBuilder"></param>
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            modelBuilder.Entity<Attribute>()
                .Property(attr => attr.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            modelBuilder.Entity<User>().HasMany(u => u.Galleries).WithRequired(g => g.OwnerUser);
        }
    }
}

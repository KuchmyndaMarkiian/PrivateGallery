using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using SafeCloud.DAL.Entities;

namespace SafeCloud.DAL.Contexts
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
        /// <summary>
        /// Setting relationships with entities
        /// </summary>
        /// <param name="modelBuilder"></param>
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            modelBuilder.Entity<User>().HasMany(u => u.Folders).WithRequired(g => g.OwnerUser);
        }
    }
}

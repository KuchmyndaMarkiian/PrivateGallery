using System;
using System.ComponentModel;
using System.Threading;
using System.Threading.Tasks;
using PrivateGallery.DAL.Contexts;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Repositories
{
    public class UnitOfWork:IDisposable
    {
        private static readonly PrivateGalleryDbContext Context = new PrivateGalleryDbContext();
        private static readonly Lazy<UnitOfWork> _unitOfWork =
            new Lazy<UnitOfWork>(LazyThreadSafetyMode.ExecutionAndPublication);
        public static UnitOfWork Instance => _unitOfWork.Value ?? new Lazy<UnitOfWork>().Value;
        public IRepository<Gallery> Gallery { get; set; } = new GalleryRepository(Context);
        public IRepository<Photo> Photos { get; set; } = new PhotoRepository(Context);
        public IRepository<User> Users { get; set; } = new UserRepository(Context);
        public void Save() => Context.SaveChanges();
        public Task SaveAsync() => Context.SaveChangesAsync();
        public void Dispose()
        {
            Gallery?.Dispose();
            Photos?.Dispose();
            Users?.Dispose();
        }
    }
}

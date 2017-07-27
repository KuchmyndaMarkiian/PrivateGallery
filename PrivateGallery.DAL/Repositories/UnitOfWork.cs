using System;
using System.ComponentModel;
using System.Threading;
using PrivateGallery.DAL.Contexts;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Repositories
{
    public class UnitOfWork:IDisposable
    {
        private static PrivateGalleryDbContext _context = new PrivateGalleryDbContext();

        private static Lazy<UnitOfWork> _unitOfWork =
            new Lazy<UnitOfWork>(LazyThreadSafetyMode.ExecutionAndPublication);

        public static UnitOfWork Instance => _unitOfWork.Value ?? new Lazy<UnitOfWork>().Value;

        public IRepository<Gallery> Gallery { get; set; } = new GalleryRepository(_context);
        public IRepository<Photo> Photos { get; set; } = new PhotoRepository(_context);
        public IRepository<User> Users { get; set; } = new UserRepository(_context);
        public void Save() => _context.SaveChanges();

        public void Dispose()
        {
            Gallery?.Dispose();
            Photos?.Dispose();
            Users?.Dispose();
        }
    }
}

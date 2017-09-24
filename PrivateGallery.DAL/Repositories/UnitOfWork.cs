using System;
using System.ComponentModel;
using System.Threading;
using System.Threading.Tasks;
using SafeCloud.DAL.Contexts;
using SafeCloud.DAL.Entities;

namespace SafeCloud.DAL.Repositories
{
    public class UnitOfWork:IDisposable
    {
        private static readonly PrivateGalleryDbContext Context = new PrivateGalleryDbContext();
        private static readonly Lazy<UnitOfWork> _unitOfWork =
            new Lazy<UnitOfWork>(LazyThreadSafetyMode.ExecutionAndPublication);
        public static UnitOfWork Instance => _unitOfWork.Value ?? new Lazy<UnitOfWork>().Value;
        public IRepository<Folder> FolderRepository { get; set; } = new FolderRepository(Context);
        public IRepository<File> FileRepository { get; set; } = new FileRepository(Context);
        public IRepository<User> UserRepository { get; set; } = new UserRepository(Context);
        public void Save() => Context.SaveChanges();
        public void SaveAsync() => Context.SaveChanges();
        public void Dispose()
        {
            FolderRepository?.Dispose();
            FileRepository?.Dispose();
            UserRepository?.Dispose();
        }
    }
}

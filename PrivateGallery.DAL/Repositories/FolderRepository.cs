using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using PrivateGallery.DAL.Contexts;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Repositories
{
    internal class FolderRepository : RepositoryBase<Folder>
    {
        public FolderRepository(PrivateGalleryDbContext context) : base(context)
        {
        }
        public override void Update(Folder item) => Context.Entry(item).State = EntityState.Modified;
        public override void Delete(Func<Folder, bool> func)
        {
            var found = Context.Folders
                .FirstOrDefault(func);
            if (found != null)
            {
                var instance = UnitOfWork.Instance;
                var list = found.Files;
                while (list.Any())
                {
                    instance.FileRepository.Delete(x => x.Id == list.First().Id);
                }
                Context.Folders.Remove(found);
            }
        }
        public override IEnumerable<Folder> GetAll() => Context.Folders;
        public override Folder Get(Func<Folder, bool> func) => Context.Folders.FirstOrDefault(func);
        public override Task<Folder> GetAsync(Expression<Func<Folder, bool>> func)=> Context.Folders.FirstOrDefaultAsync(func);
        public override void Create(Folder item) => Context.Folders.Add(item);
    }
}
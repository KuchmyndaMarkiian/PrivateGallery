using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using PrivateGallery.DAL.Contexts;
using File = PrivateGallery.DAL.Entities.File;

namespace PrivateGallery.DAL.Repositories
{
    internal class FileRepository : RepositoryBase<File>
    {
        public FileRepository(PrivateGalleryDbContext context) : base(context)
        {
        }
        public override void Update(File item) => Context.Entry(item).State = EntityState.Modified;

        public override void Delete(Func<File, bool> func)
        {
            var found = Context.Files
                .FirstOrDefault(func);
            if (found != null)
            {
                string main = AppDomain.CurrentDomain.BaseDirectory;
                if (!string.IsNullOrEmpty(found.Path))
                {
                    var path = found.Path;
                    var file = $"{main}{path.TrimStart('~')}";
                    var info = new FileInfo(file);
                    if (info.Exists)
                    {
                        System.IO.File.Delete(file);
                    }
                }
                Context.Attributes.Remove(found.Attribute);
                Context.Files.Remove(found);
            }
        }

        public override IEnumerable<File> GetAll() => Context.Files;
        public override File Get(Func<File, bool> func) => Context.Files.FirstOrDefault(func);
        public override Task<File> GetAsync(Expression<Func<File, bool>> func)=> Context.Files.FirstOrDefaultAsync(func);
        public override void Create(File item) => Context.Files.Add(item);
    }
}
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using SafeCloud.DAL.Contexts;
using File = SafeCloud.DAL.Entities.File;

namespace SafeCloud.DAL.Repositories
{
    internal class FileRepository : RepositoryBase<File>
    {
        public FileRepository(SafeCloudDbContext context) : base(context)
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
                Context.Files.Remove(found);
            }
        }
        public override IEnumerable<File> GetAll(Func<File, bool> func = null) => func == null ? Context.Files : Context.Files.Where(func);
        public override File Get(Func<File, bool> func) => Context.Files.FirstOrDefault(func);
        public override Task<File> GetAsync(Expression<Func<File, bool>> func)=> Context.Files.FirstOrDefaultAsync(func);
        public override void Create(File item) => Context.Files.Add(item);
    }
}
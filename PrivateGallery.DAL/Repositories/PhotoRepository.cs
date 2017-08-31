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
    internal class PhotoRepository : RepositoryBase<Photo>
    {
        public PhotoRepository(PrivateGalleryDbContext context) : base(context)
        {
        }
        public override void Update(Photo item) => Context.Entry(item).State = EntityState.Modified;
        public override void Delete(Func<Photo, bool> func)
        {
            var found = Context.Photos
                .FirstOrDefault(func);
            if (found != null)
                Context.Photos.Remove(found);
        }
        public override IEnumerable<Photo> GetAll() => Context.Photos;
        public override Photo Get(Func<Photo, bool> func) => Context.Photos.FirstOrDefault(func);
        public override Task<Photo> GetAsync(Expression<Func<Photo, bool>> func)=> Context.Photos.FirstOrDefaultAsync(func);
        public override void Create(Photo item) => Context.Photos.Add(item);
    }
}
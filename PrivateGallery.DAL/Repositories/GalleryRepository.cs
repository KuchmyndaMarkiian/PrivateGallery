using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using PrivateGallery.DAL.Contexts;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Repositories
{
    internal class GalleryRepository : RepositoryBase<Gallery>
    {
        public GalleryRepository(PrivateGalleryDbContext context) : base(context)
        {
        }

        public override void Update(Gallery item) => Context.Entry(item).State = EntityState.Modified;

        public override void Delete(Func<Gallery, bool> func)
        {
            var found = Context.Galleries
                .FirstOrDefault(func);
            if (found != null)
                Context.Galleries.Remove(found);
        }

        public override IEnumerable<Gallery> GetAll() => Context.Galleries;

        public override Gallery Get(Func<Gallery, bool> func) => Context.Galleries.FirstOrDefault(func);

        public override void Create(Gallery item)
        {
            Context.Galleries.Add(item);
        }
    }
}
using System;
using System.Collections.Generic;
using PrivateGallery.DAL.Contexts;

namespace PrivateGallery.DAL.Repositories
{
    abstract class RepositoryBase<T> : IRepository<T> where T:class
    {
        protected PrivateGalleryDbContext Context;

        protected RepositoryBase(PrivateGalleryDbContext context)
        {
            this.Context = context;
        }

        public abstract void Delete(Func<T, bool> func);

        public abstract T Get(Func<T, bool> func);

        public abstract void Create(T item);

        public abstract  IEnumerable<T> GetAll();

        public abstract void Update(T item);

        public void Dispose()
        {
            Context?.Dispose();
        }
    }
}
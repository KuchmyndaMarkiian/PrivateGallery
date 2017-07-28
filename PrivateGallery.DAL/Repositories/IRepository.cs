using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Repositories
{
    public interface IRepository<T>:IDisposable where T:class
    {
        IEnumerable<T> GetAll();
        T Get(Func<T, bool> func);
        Task<T> GetAsync(Expression<Func<T, bool>> func);
        void Create(T item);
        void Update(T item);
        void Delete(Func<T,bool> func);
    }
}
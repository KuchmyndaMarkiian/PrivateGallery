using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using SafeCloud.DAL.Entities;

namespace SafeCloud.DAL.Repositories
{
    public interface IRepository<T>:IDisposable where T:class
    {
        /// <summary>
        /// Gets all objects by the preset type with conctere condition
        /// </summary>
        /// <returns></returns>
        IEnumerable<T> GetAll(Func<T,bool> func = null);
        /// <summary>
        /// Gets the concrete object by the preset type through some condition(-s)
        /// </summary>
        /// <returns></returns>
        T Get(Func<T, bool> func);
        /// <summary>
        /// Gets the concrete object by the preset type through some condition(-s)
        /// </summary>
        /// <returns></returns>
        Task<T> GetAsync(Expression<Func<T, bool>> func);
        /// <summary>
        /// Adds the new object to the DB collection
        /// </summary>
        /// <returns></returns>
        void Create(T item);
        /// <summary>
        /// Updates the concrete existed object
        /// </summary>
        /// <returns></returns>
        void Update(T item);
        /// <summary>
        /// Remove the conctete object from DB
        /// </summary>
        /// <returns></returns>
        void Delete(Func<T,bool> func);
    }
}
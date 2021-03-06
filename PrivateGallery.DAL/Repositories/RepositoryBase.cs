﻿using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using SafeCloud.DAL.Contexts;
using SafeCloud.DAL.Entities;

namespace SafeCloud.DAL.Repositories
{
    internal abstract class RepositoryBase<T> : IRepository<T> where T:class
    {
        protected SafeCloudDbContext Context;
        protected RepositoryBase(SafeCloudDbContext context) => this.Context = context;
        public abstract void Delete(Func<T, bool> func);
        public abstract IEnumerable<T> GetAll(Func<T, bool> func);
        public abstract T Get(Func<T, bool> func);
        public abstract Task<T> GetAsync(Expression<Func<T, bool>> func);
        public abstract void Create(T item);
        public abstract void Update(T item);
        public void Dispose() => Context?.Dispose();
    }
}
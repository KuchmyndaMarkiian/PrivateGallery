using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;
using PrivateGallery.DAL.Contexts;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Repositories
{
    internal class UserRepository : RepositoryBase<User>
    {
        public UserRepository(PrivateGalleryDbContext context) : base(context)
        {
        }

        public override void Update(User item) => Context.Entry(item).State = EntityState.Modified;

        public override void Delete(Func<User, bool> func)
        {
            var found = Context.Users
                .FirstOrDefault(func);
            if (found != null)
                Context.Users.Remove(found);
        }

        public override IEnumerable<User> GetAll() => Context.Users;
        public override User Get(Func<User, bool> func) => Context.Users.FirstOrDefault(func);

        public override Task<User> GetAsync(Expression<Func<User, bool>> func) => Context.Users.FirstOrDefaultAsync(
            func);

        public override void Create(User item) => Context.Users.Add(item);
    }
}
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;
using SafeCloud.DAL.Contexts;
using SafeCloud.DAL.Entities;

namespace SafeCloud.DAL.Repositories
{
    internal class UserRepository : RepositoryBase<User>
    {
        public UserRepository(SafeCloudDbContext context) : base(context)
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

        public override IEnumerable<User> GetAll(Func<User, bool> func = null) => func == null ? Context.Users : Context.Users.Where(func);
        public override User Get(Func<User, bool> func) => Context.Users.FirstOrDefault(func);

        public override Task<User> GetAsync(Expression<Func<User, bool>> func) => Context.Users.FirstOrDefaultAsync(
            func);

        public override void Create(User item) => Context.Users.Add(item);
    }
}
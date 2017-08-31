using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace PrivateGallery.DAL.Entities
{
    public class User : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager,
            string authenticationType)
        {
            var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
            return userIdentity;
        }

        public string AvatarPath { get; set; } = null;
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public virtual List<Gallery> Galleries { get; set; } = new List<Gallery>();
    }
}

using System;
using PrivateGallery.Android.Models;

namespace PrivateGallery.Android.Infrastructure
{
    internal class UserAccount : AccountInfoViewModel
    {
        private static Lazy<UserAccount> _instance = new Lazy<UserAccount>();
        public static UserAccount Instance => _instance.Value ?? new Lazy<UserAccount>().Value;
        public string Password { get; set; }
        public UserToken UserToken { get; set; }
        public byte[] Avatar { get; set; }

        public void Clone(AccountInfoViewModel model)
        {
            FirstName = model.FirstName;
            LastName = model.LastName;
            Email = model.Email;
        }
    }
}
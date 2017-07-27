namespace PrivateGallery.Models
{
    class UserAccount:AccountInfoViewModel
    {
        private static UserAccount _instance;

        public static UserAccount Instance
        {
            get
            {
                lock (_instance)
                    return _instance ?? new UserAccount();
            }
        }
        public string Password { get; set; }
        public  UserToken UserToken { get; set; }
        public byte[] Avatar { get; set; }
    }
}
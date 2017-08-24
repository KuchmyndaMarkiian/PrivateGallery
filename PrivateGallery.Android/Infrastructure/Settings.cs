using System;

namespace PrivateGallery.Android.Infrastructure
{
    internal class Settings
    {
        #region Singleton

        private Settings()
        {
        }

        public static Settings Instance => SyncRoot.Value;

        private static readonly Lazy<Settings> SyncRoot = new Lazy<Settings>(() => new Settings());

        #endregion

        #region URL Constants

        public static string ServerAdress { get; } = "http://192.168.0.106:57643";

        #region Authorization

        public static string RegisterAdress { get; } = "/api/Account/Register";
        public static string LoginAdress { get; } = "/Token";
        public static string LogoutAdress { get; } = "/api/Account/LogOut";
        public static string UserInfo { get; } = "/api/Account/AccountInfo";
        public static string AvatarAdress { get; } = "/api/Account/UpdateAvatar";

        public static string RestorePasswordAdress { get; } = "/api/Account/RestorePassword";

        #endregion

        #region Gallery

        public static string GalleryAdress { get; } = "/api/Gallery";
        public static string GalleryListAdress { get; } = "/api/Gallery/List";


        #endregion

        #region Picture

        public static string DownloadPictureAdress { get; } = "/api/Picture/Download";
        public static string PictureAdress { get; } = "/api/Picture";

        #endregion

        #endregion

        #region Types

        public string MimeJson => "application/json";

        #endregion

        #region StorageKeys

        public static class StorageKeys
        {
            public static string UserKey { get; } = "userdata_key";
            public static string ChatKey { get; } = "chatsession_key";
            public static string PicturesKey { get; } = "pictures_key";
        }

        #endregion
    }
}

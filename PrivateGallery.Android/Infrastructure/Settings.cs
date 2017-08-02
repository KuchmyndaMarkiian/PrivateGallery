using System;

namespace PrivateGallery.Android.Infrastructure
{
    class Settings
    {
        #region Singleton

        private Settings()
        {
        }

        public static Settings Instance => SyncRoot.Value;

        private static readonly Lazy<Settings> SyncRoot = new Lazy<Settings>(() => new Settings());

        #endregion

        #region URL Constants

        public static string ServerAdress { get; } = "http://192.168.0.104:57643";

        #region Authorization

        public static string RegisterAdress { get; } = "/api/Account/Register";
        public static string LoginAdress { get; } = "/Token";
        public static string LogoutAdress { get; } = "/api/Account/LogOut";
        public static string UserInfo { get; } = "/api/Account/AccountInfo";
        public static string PictureAdress { get; } = "/api/Account/UpdateAvatar";
        #endregion

        #region Data

        public static string GalleryListAdress { get; } = "/api/Gallery/List";
        public static string DownloadPhotoAdress { get; } = "/api/Picture/Download";

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

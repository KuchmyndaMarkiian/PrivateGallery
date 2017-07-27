using System;

namespace PrivateGallery.Infrastructure
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

        public string ServerAdress { get; } = "http://192.168.1.104:57643";

        #region Authorization

        public string RegisterAdress { get; } = "/api/Account/Register";
        public string LoginAdress { get; } = "/Token";
        public string LogoutAdress { get; } = "/api/Account/LogOut";
        public string UserInfo { get; } = "api/Account/AccountInfo";


        #endregion

        #region Game

        public string AchievementsAdress { get; } = "/api/UserData/UserAchievements";
        public string PictureAdress { get; } = "/api/Upload";
        public string TopicsAddress { get; set; } = "/get_word_topics/";

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

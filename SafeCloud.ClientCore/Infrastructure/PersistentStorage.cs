using Newtonsoft.Json;
using Plugin.Settings;
using Plugin.Settings.Abstractions;

namespace SafeCloud.ClientCore.Infrastructure
{
    class PersistentStorage
    {
        /// <summary>
        /// This is the Settings static class that can be used in your Core solution or in any
        /// of your client applications. All settings are laid out the same exact way with getters
        /// and setters. 
        /// </summary>
        public static class Settings
        {
            private static ISettings AppSettings => CrossSettings.Current;

            public static T ReadValue<T>(string key)
            {
                var readvalue = AppSettings.GetValueOrDefault(key, null);
                if (readvalue == null)
                    return default(T);
                return JsonConvert.DeserializeObject<T>(readvalue);
            }

            public static void SaveValue<T>(string key, T value)
            {
                if (!AppSettings.AddOrUpdateValue(key, JsonConvert.SerializeObject(value)))
                    System.Console.WriteLine($"Not added/updated {key}");
            }
        }
    }
}

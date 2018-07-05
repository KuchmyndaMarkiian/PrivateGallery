using System.Linq;
using Android;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Preferences;
using Android.Support.V4.App;
using Newtonsoft.Json;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.Droid.Infractructure
{
    public class SharedPreferences : IKeyValuePairStorage<Activity>
    {
        private ISharedPreferences _sharedPreferences;
        private Activity _platformObject;

        public Activity PlatformObject
        {
            get => _platformObject;
            set
            {
                _platformObject = value; 
                _sharedPreferences = PreferenceManager.GetDefaultSharedPreferences(value);
            }
        }

        public void Write(string key, object obj)
        {
            CheckPermissions();
            var editor = _sharedPreferences.Edit();
            switch (obj)
            {
                case bool b:
                    editor.PutBoolean(key, b);
                    break;
                case int i:
                    editor.PutInt(key, i);
                    break;
                case float f:
                    editor.PutFloat(key, f);
                    break;
                case string s:
                    editor.PutString(key, s);
                    break;
                default:
                    if (obj != null)
                        editor.PutString(key, JsonConvert.SerializeObject(obj));
                    break;
            }

            editor.Apply();
        }

        public object Read<T>(string key)
        {
            CheckPermissions();
            if (!_sharedPreferences.Contains(key))
                return null;
            var type = typeof(T);
            if (type == ConstTypes.Boolean) return _sharedPreferences.GetBoolean(key, false);
            if (type == ConstTypes.Integer) return _sharedPreferences.GetInt(key, 0);
            if (type == ConstTypes.Single) return _sharedPreferences.GetFloat(key, 0.0f);
            if (type == ConstTypes.String) return _sharedPreferences.GetString(key, null);

            return JsonConvert.DeserializeObject(_sharedPreferences.GetString(key, null));
        }

        public void Clear() => _sharedPreferences.Edit().Clear();

        public void Dispose() => _sharedPreferences?.Dispose();

        // Todo: Permissions still does not work
        private void CheckPermissions()
        {
            if (Build.VERSION.SdkInt >= BuildVersionCodes.M)
            {
                var permissions = new (string permission, int code, bool isNeeded)[]
                {
                    (Manifest.Permission.ReadExternalStorage, Permissions.ReadFromStorage, false),
                    (Manifest.Permission.WriteExternalStorage, Permissions.WriteToStorage, false)
                };
                foreach (var t in permissions)
                {
                    var permission = t;
                    var checkSelfPermission = PlatformObject.CheckSelfPermission(permission.permission);
                    if (checkSelfPermission != Permission.Granted)
                        permission.isNeeded = true;
                }

                if (permissions.Any(x => x.isNeeded))
                {
                    foreach (var deniedPermission in permissions.Where(x => x.isNeeded))
                    {
                        if (ActivityCompat.ShouldShowRequestPermissionRationale(PlatformObject,
                            deniedPermission.permission))
                        {

                        }
                        else
                        {
                            ActivityCompat.RequestPermissions(PlatformObject, new[] {deniedPermission.permission},
                                deniedPermission.code);
                        }
                    }
                }
            }
        }
    }
}
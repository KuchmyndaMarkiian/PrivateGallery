using System.Linq;
using Android;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Preferences;
using Newtonsoft.Json;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.Droid.Infractructure
{
    public class SharedPreferences : IKeyValuePairStorage<Activity>
    {
        private readonly ISharedPreferences _sharedPreferences = PreferenceManager.GetDefaultSharedPreferences(Application.Context);
        private IPermissionManager<Activity> _permissionManager;

        public Activity PlatformObject { get; set; }

        public void Write(string key, object obj)
        {
            CheckPermissions();
            var editor = _sharedPreferences.Edit();
            if (_sharedPreferences.Contains(key))
                editor.Remove(key);
            
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
                    {
                        var serializeObject = JsonConvert.SerializeObject(obj);
                        editor.PutString(key, serializeObject);
                    }

                    break;
            }

            editor.Commit();
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

            var deserializeObject = JsonConvert.DeserializeObject<T>(_sharedPreferences.GetString(key, null));
            return deserializeObject;
        }

        public void Clear() => _sharedPreferences.Edit().Clear();

        public void Dispose() => _sharedPreferences?.Dispose();

        // Todo: PermissionCodes still does not work
        private void CheckPermissions()
        {
            if(_permissionManager == null)
                _permissionManager = ApplicationFacade.Facade.Resolver.Resolve<IPermissionManager<Activity>>(manager => manager.PlatformObject = PlatformObject);
            if (Build.VERSION.SdkInt >= BuildVersionCodes.M)
            {
                var permissions = new (string permission, int code, bool isNeeded)[]
                {
                    (Manifest.Permission.ReadExternalStorage, PermissionCodes.ReadFromStorage, false),
                    (Manifest.Permission.WriteExternalStorage, PermissionCodes.WriteToStorage, false),
                    (Manifest.Permission.AccessFineLocation, PermissionCodes.WriteToStorage, false)
                };
                foreach (var t in permissions)
                {
                    var permission = t;
                    if (!_permissionManager.IsGrantedPermission(permission.permission))
                        permission.isNeeded = true;
                }

                if (permissions.Any(x => x.isNeeded))
                {
                    foreach (var deniedPermission in permissions.Where(x => x.isNeeded))
                    {
                        if (_permissionManager.NeedToShowRequestPermissions(deniedPermission.permission))
                        {

                        }
                        else
                        {
                            _permissionManager.RequestPermissions(deniedPermission.permission, deniedPermission.code);
                        }
                    }
                }
            }
        }
    }
}
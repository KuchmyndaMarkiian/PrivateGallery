using System;
using Android.App;
using Android.Content.PM;
using Android.Support.V4.App;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.Droid.Infractructure
{
    class DroidPermissionManager : IPermissionManager<Activity>
    {
        public Activity PlatformObject { get; set; }
        public bool IsGrantedPermission(string permission) => PlatformObject.CheckSelfPermission(permission) == Permission.Granted;

        public bool NeedToShowRequestPermissions(string permission) =>
            ActivityCompat.ShouldShowRequestPermissionRationale(PlatformObject, permission);

        public void RequestPermissions(string permission, int code) => ActivityCompat.RequestPermissions(PlatformObject, new[] { permission }, code);
    }
}
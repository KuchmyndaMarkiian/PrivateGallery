namespace SafeCloud.ClientCore.Infrastructure
{
    public interface IPermissionManager<T>
    {
        T PlatformObject { get; set; }
        bool IsGrantedPermission(string permission);
        bool NeedToShowRequestPermissions(string permission);
        void RequestPermissions(string permission, int code);
    }

    public static class PermissionCodes
    {
        public const int WriteToStorage =10;
        public const int ReadFromStorage = 11;
    }
}

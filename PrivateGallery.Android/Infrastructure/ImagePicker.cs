using System.Collections.Generic;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Provider;
using Java.IO;
using PrivateGallery.Android.Models;
using Environment = Android.OS.Environment;

namespace PrivateGallery.Android.Infrastructure
{
    class ImagePicker
    {
        private readonly Activity _activity;

        public ImagePicker(Activity activity)
        {
            _activity = activity;
        }

        public void CreateStorage()
        {
            App.Dir = new File(Environment.GetExternalStoragePublicDirectory(Environment.DirectoryPictures),
                "CameraAppDemo");
            if (!App.Dir.Exists())
            {
                App.Dir.Mkdir();
            }
        }

        public bool CanPickPhoto()
        {
            Intent intent = new Intent(MediaStore.ActionImageCapture);
            IList<ResolveInfo> availableActivities =
                _activity.PackageManager.QueryIntentActivities(intent, PackageInfoFlags.MatchDefaultOnly);
            return availableActivities != null && availableActivities.Count > 0;
        }
    }
}
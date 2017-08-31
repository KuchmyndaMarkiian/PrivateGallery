using System;
using Android.App;
using Android.Provider;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Android.Helpers
{
    internal sealed class FileHelper
    {
        /// <summary>
        /// Get real absolute path of file which selected from the device.
        /// </summary>
        /// <param name="contentUri"></param>
        /// <param name="activity"></param>
        /// <returns></returns>
        public static string GetRealPathFromUri(Uri contentUri, Activity activity)
        {
            string docId;
            using (var c1 = activity.ContentResolver.Query(contentUri, null, null, null, null))
            {
                c1.MoveToFirst();
                var documentId = c1.GetString(0);
                docId = documentId.Substring(documentId.LastIndexOf(":", StringComparison.Ordinal) + 1);
            }
            string path = null;
            // The projection contains the columns we want to return in our query.
            string selection = MediaStore.Images.Media.InterfaceConsts.Id + " =? ";
            using (var cursor = activity.ManagedQuery(MediaStore.Images.Media.ExternalContentUri, null, selection,
                new[] {docId},
                null))
            {
                if (cursor == null) return path;
                var columnIndex =
                    cursor.GetColumnIndexOrThrow(MediaStore.Images.Media.InterfaceConsts.Data);
                cursor.MoveToFirst();
                path = cursor.GetString(columnIndex);
            }
            return path;
        }
    }
}
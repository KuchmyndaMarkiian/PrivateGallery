using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Provider;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Android.Helpers
{
    class FileHelper
    {
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
            string selection = global::Android.Provider.MediaStore.Images.Media.InterfaceConsts.Id + " =? ";
            using (var cursor = activity.ManagedQuery(MediaStore.Images.Media.ExternalContentUri, null, selection, new[] { docId },
                null))
            {
                if (cursor == null) return path;
                var columnIndex =
                    cursor.GetColumnIndexOrThrow(global::Android.Provider.MediaStore.Images.Media.InterfaceConsts.Data);
                cursor.MoveToFirst();
                path = cursor.GetString(columnIndex);
            }
            return path;
        }
    }
}
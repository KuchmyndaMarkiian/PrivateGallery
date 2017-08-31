using Android.Content;
using Android.Widget;

namespace PrivateGallery.Android.CustomControls
{
    /// <summary>
    /// Custom Control with some textviews
    /// </summary>
    internal class CustomListItemGallery : LinearLayout
    {
        #region Properties

        public string Header { get; set; }
        public string Date { get; set; }
        public int Count { get; set; }

        #endregion

        public CustomListItemGallery(Context context) : base(context)
        {
            Inflate(Context, Resource.Layout.UCGalleryItem, this);
        }

        public void Initialize()
        {
            FindViewById<TextView>(Resource.Id.galleryHeader).Text = Header;
            FindViewById<TextView>(Resource.Id.galleryDate).Text = Date;
            FindViewById<TextView>(Resource.Id.galleryCount).Text = Count.ToString();
        }
    }
}
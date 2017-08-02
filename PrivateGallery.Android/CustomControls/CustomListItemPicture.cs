using Android.Content;
using Android.Graphics;
using Android.Widget;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.CustomControls
{
    internal class CustomListItemPicture : LinearLayout
    {
        public PictureBindingModel _model { get; set; }
        public CustomListItemPicture(Context context) : base(context)
        {
            Inflate(Context, Resource.Layout.UCPictureItem, this);
        }

        public void Initialize()
        {
            FindViewById<TextView>(Resource.Id.pictureHeader).Text = _model.Name;
            FindViewById<TextView>(Resource.Id.pictureDate).Text = _model.DateTime.ToShortDateString();
            FindViewById<ImageView>(Resource.Id.pictureView).SetImageBitmap(BitmapFactory.DecodeStream(_model.Content));
        }
    }
}
using Android.Content;
using Android.Graphics;
using Android.Widget;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.CustomControls
{
    internal class CustomPictureItem : LinearLayout
    {
        #region Fields

        private readonly PictureBindingModel _model;

        #endregion

        public CustomPictureItem(Context context, PictureBindingModel model) : base(context)
        {
            _model = model;
            Inflate(context, Resource.Layout.UCPictureLayout, this);
        }

        public void Initialize()
        {
            FindViewById<ImageView>(Resource.Id.ucPicture).SetImageBitmap(BitmapFactory.DecodeStream(_model.Content));
        }
    }
}
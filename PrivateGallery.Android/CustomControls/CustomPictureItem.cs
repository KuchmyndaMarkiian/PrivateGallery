using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.Graphics;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.CustomControls
{
    class CustomPictureItem : LinearLayout
    {
        private readonly PictureBindingModel _model;

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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Models
{
    public class PictureModel:PictureBindingModel
    {
        public new byte[] Content { get; set; }
    }
}
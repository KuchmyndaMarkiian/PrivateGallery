using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Models
{
    public class PictureModel:PictureBindingModel
    {
        public new byte[] Content { get; set; }
    }
}
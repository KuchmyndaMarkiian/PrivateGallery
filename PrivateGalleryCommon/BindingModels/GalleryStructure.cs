using System.Collections.Generic;

namespace PrivateGallery.Common.BindingModels
{
    public class GalleryStructure : GalleryBindindModel
    {
        public IEnumerable<PictureBindingModel> Pictures { get; set; }
    }
}
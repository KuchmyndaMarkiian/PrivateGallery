using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.DAL.Entities;

namespace PrivateGallery.DAL.Infrastructure
{
    public class DalEntityCreator
    {
        public Gallery CreateGalleryEntity(GalleryBindindModel model) => new Gallery
        {
            CreatedDate = model.DateTime,
            Header = model.Name
        };

        public Photo CreatePhotoEntity() => new Photo();
    }
}

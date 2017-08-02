using System;
using System.Collections.Generic;
using PrivateGalleryNew.Models;

namespace PrivateGallery.Android.Models
{
    public class GalleryStructure: IStructure
    {
        public IEnumerable<PictureStructure> Pictures { get; set; }
        public string Name { get; set; }
        public DateTime DateTime { get; set; }
    }
}
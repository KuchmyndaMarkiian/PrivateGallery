using System;

namespace PrivateGallery.Android.Models
{
    public class PictureStructure: IStructure
    {
        public string Description { get; set; }
        public string Geolocation { get; set; }
        public string Name { get; set; }
        public DateTime DateTime { get; set; }
    }
}
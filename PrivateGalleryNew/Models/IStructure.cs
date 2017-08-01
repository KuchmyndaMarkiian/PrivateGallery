using System;

namespace PrivateGalleryNew.Models
{
    interface IStructure
    {
        string Name { get; set; }
        DateTime DateTime { get; set; }
    }
}
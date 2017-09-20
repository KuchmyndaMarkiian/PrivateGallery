using System;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.DAL.Entities;
using PrivateGallery.DAL.Repositories;
using Attribute = PrivateGallery.DAL.Entities.Attribute;

namespace PrivateGallery.DAL.Infrastructure
{
    /// <summary>
    /// Template methods
    /// </summary>
    public static class DalEntityCreator
    {
        public static Folder CreateGalleryEntity(GalleryBindindModel model) => new Folder
        {
            Id = $"{model.Name}{DateTime.Now.Ticks}",
            ParentFolder = string.IsNullOrEmpty(model.ParentId)
                ? null
                : UnitOfWork.Instance.FolderRepository.Get(x => x.Id == model.ParentId),
            CreatedDate = model.DateTime,
            Header = model.Name,
            Attribute = model.Attribute == null
                ? new Attribute()
                : new Attribute() {HasPublicAccess = model.Attribute.HasPublicAccess}
        };

        public static File CreatePhotoEntity(PictureBindingModel model) => new File
        {
            Id = $"{model.Name}{DateTime.Now.Ticks}",
            ParentFolder = string.IsNullOrEmpty(model.ParentId)
                ? null
                : UnitOfWork.Instance.FolderRepository.Get(x => x.Id == model.ParentId),
            Header = model.Name,
            Description = model.Description,
            Geolocation = model.Geolocation,
            CreatedDate = model.DateTime,
            Attribute = model.Attribute == null
                ? new Attribute()
                : new Attribute {HasPublicAccess = model.Attribute.HasPublicAccess}
        };
    }
}

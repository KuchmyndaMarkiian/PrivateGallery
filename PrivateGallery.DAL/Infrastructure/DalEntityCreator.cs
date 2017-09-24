using System;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.DAL.Entities;
using PrivateGallery.DAL.Repositories;

namespace PrivateGallery.DAL.Infrastructure
{
    /// <summary>
    /// Template methods
    /// </summary>
    public static class DalEntityCreator
    {
        public static Folder CreateGalleryEntity(FolderBindindModel model) => new Folder
        {
            Id = $"{model.Name}{DateTime.Now.Ticks}",
            ParentFolder = string.IsNullOrEmpty(model.ParentId)
                ? null
                : UnitOfWork.Instance.FolderRepository.Get(x => x.Id == model.ParentId),
            CreatedDate = model.DateTime,
            Header = model.Name
        };

        public static File CreatePhotoEntity(FileBindingModel model) => new File
        {
            Id = $"{model.Name}{DateTime.Now.Ticks}",
            ParentFolder = string.IsNullOrEmpty(model.ParentId)
                ? null
                : UnitOfWork.Instance.FolderRepository.Get(x => x.Id == model.ParentId),
            Header = model.Name,
            Description = model.Description,
            Geolocation = model.Geolocation,
            CreatedDate = model.DateTime
        };
    }
}

using System;
using SafeCloud.Common.BindingModels;
using SafeCloud.DAL.Entities;
using SafeCloud.DAL.Repositories;

namespace SafeCloud.DAL.Infrastructure
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

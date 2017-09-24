using System.Collections.Generic;

namespace PrivateGallery.Common.BindingModels
{
    public sealed class FileStructure : FolderBindindModel
    {
        public IEnumerable<FileBindingModel> Files { get; set; }
    }
}
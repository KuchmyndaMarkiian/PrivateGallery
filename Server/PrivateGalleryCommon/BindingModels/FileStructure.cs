using System.Collections.Generic;

namespace SafeCloud.Common.BindingModels
{
    public sealed class FileStructure : FolderBindindModel
    {
        public IEnumerable<FileBindingModel> Files { get; set; }
    }
}
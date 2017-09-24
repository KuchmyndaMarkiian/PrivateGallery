using System;
using System.ComponentModel.DataAnnotations;

namespace SafeCloud.Common.BindingModels
{
    public class FolderBindindModel
    {
        public string Id { get; set; }
        public string ParentId { get; set; }
        [Microsoft.Build.Framework.Required]
        [StringLength(100,ErrorMessage = "Empty header for creating object",MinimumLength = 1)]
        public string Name { get; set; }
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty header for creating object", MinimumLength = 1)]
        public string NewName { get; set; }
        [Microsoft.Build.Framework.Required]
        [StringLength(100, ErrorMessage = "Empty description for creating object", MinimumLength = 1)]
        public string Description { get; set; }
        [Microsoft.Build.Framework.Required]
        public DateTime DateTime { get; set; }
        public bool AttributeHasPublicAccess { get; set; }= false;
    }
}

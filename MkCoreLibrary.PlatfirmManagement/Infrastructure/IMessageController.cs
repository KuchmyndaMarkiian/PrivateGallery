using System;
using System.Threading.Tasks;

namespace MkCoreLibrary.PlatformManagement.Infrastructure
{
    public interface IMessageController
    {
        Task ShowErrorMessage(string message);
        Task ShowDialogMessage(string message);
        Task ShowPopupMessage(string message);
        Task ShowCustomDialogMessage(string message, Action firstAction = null, Action secondAction = null);
    }

    public interface IMessageController<TPlatform> : IMessageController
    {
        TPlatform PlatformMessageController { get; set; }
    }
}

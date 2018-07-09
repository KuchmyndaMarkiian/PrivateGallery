using System;
using System.Threading.Tasks;
using Android.App;
using Android.Widget;
using MkCoreLibrary.PlatformManagement.Infrastructure;

namespace SafeCloud.Droid.Infractructure
{
    public class DroidMessageController : IMessageController<Activity>
    {
        public Activity PlatformMessageController { get; set; }
        public Task ShowErrorMessage(string message)
        {
            if (IsControllerSet)
            {
                ShowPopupMessage(message);
            }
            return Task.CompletedTask;
        }

        public Task ShowDialogMessage(string message)
        {
            if (IsControllerSet)
            {
                ShowPopupMessage(message);
            }
            return Task.CompletedTask;
        }

        public Task ShowPopupMessage(string message)
        {
            if (IsControllerSet)
                Toast.MakeText(PlatformMessageController, message, ToastLength.Short).Show();
            return Task.CompletedTask;
        }

        public Task ShowCustomDialogMessage(string message, Action firstAction = null, Action secondAction = null)
        {
            if (IsControllerSet)
            {
                ShowPopupMessage(message);
            }
            return Task.CompletedTask;
        }

        private bool IsControllerSet => PlatformMessageController != null;
    }
}
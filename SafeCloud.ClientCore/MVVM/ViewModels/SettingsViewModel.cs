using System.Threading.Tasks;
using System.Windows.Input;
using ReactiveUI;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.ClientCore.MVVM.Models;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class SettingsViewModel : ReactiveViewModel
    {
        private const string Key = "AppSettings";

        public override void Initialize()
        {
            SettingModel = PersistentStorage.Settings.ReadValue<SettingModel>(Key) ?? new SettingModel();

            SaveCommand = ReactiveCommand.CreateFromTask(() =>
            {
                PersistentStorage.Settings.SaveValue(Key, SettingModel);
                return Task.CompletedTask;
            });
        }

        [Reactive]
        public SettingModel SettingModel { get; set; }

        public ICommand SaveCommand { get; set; }
    }
}
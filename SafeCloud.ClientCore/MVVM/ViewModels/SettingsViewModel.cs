using System.Threading.Tasks;
using System.Windows.Input;
using MkCoreLibrary.PlatformManagement.Infrastructure;
using MkCoreLibrary.ViewModels;
using ReactiveUI;
using ReactiveUI.Fody.Helpers;
using SafeCloud.ClientCore.MVVM.Models;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public class SettingsViewModel : ReactiveViewModel
    {
        private const string Key = "AppSettings";
        public IKeyValuePairStorage Storage { get; set; }

        public override void Initialize()
        {
            SettingModel = (SettingModel) (Storage.Read<SettingModel>(Key) ?? new SettingModel());
            SaveCommand = ReactiveCommand.CreateFromTask(() =>
            {
                Storage.Write(Key, SettingModel);
                return Task.CompletedTask;
            });
        }

        [Reactive]
        public SettingModel SettingModel { get; set; }

        public ICommand SaveCommand { get; set; }
    }
}
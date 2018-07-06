using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public interface IInnerViewModelKeeper
    {
        ReactiveViewModel InnerViewModel { get; set; }
    }
}

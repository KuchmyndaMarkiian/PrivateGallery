using System.Collections.Generic;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public interface IInnerViewModelKeeper
    {
        ReactiveViewModel InnerViewModel { get; }
        void SetInnerViewModel(ReactiveViewModel reactiveViewModel);
    }

    public interface IInnerViewModelStackKeeper
    {
        Stack<ReactiveViewModel> InnerViewModelStack { get; }
    }
}

using System.Collections.Generic;

namespace MkCoreLibrary.ViewModels
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

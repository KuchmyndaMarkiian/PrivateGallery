using System.Collections.Generic;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.MVVM.ViewModels
{
    public abstract class ReactiveNavigatedViewModel : ReactiveViewModel, IInnerViewModelKeeper, IInnerViewModelStackKeeper {
        public ReactiveViewModel InnerViewModel { get; private set; }
        public void SetInnerViewModel(ReactiveViewModel reactiveViewModel)
        {
            InnerViewModel = reactiveViewModel;
            InnerViewModelStack.Push(InnerViewModel);
        }

        public Stack<ReactiveViewModel> InnerViewModelStack { get; } = new Stack<ReactiveViewModel>();
    }
}
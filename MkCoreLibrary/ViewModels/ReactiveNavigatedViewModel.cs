using System.Collections.Generic;

namespace MkCoreLibrary.ViewModels
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
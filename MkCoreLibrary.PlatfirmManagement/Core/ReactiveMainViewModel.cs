using System.Collections.Generic;
using MkCoreLibrary.ViewModels;

namespace MkCoreLibrary.PlatformManagement.Core
{
    public abstract class ReactiveMainViewModel : ReactiveNavigatableViewModel, IInnerViewModelKeeper, IInnerViewModelStackKeeper {
        public ReactiveViewModel InnerViewModel { get; private set; }
        public void SetInnerViewModel(ReactiveViewModel reactiveViewModel)
        {
            InnerViewModel = reactiveViewModel;
            InnerViewModelStack.Push(InnerViewModel);
        }

        public Stack<ReactiveViewModel> InnerViewModelStack { get; } = new Stack<ReactiveViewModel>();
    }
}
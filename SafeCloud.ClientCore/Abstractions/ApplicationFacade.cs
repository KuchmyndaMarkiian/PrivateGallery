using System;
using System.Collections.Generic;
using Autofac.Core;

namespace SafeCloud.ClientCore.Abstractions
{
    public abstract class ApplicationFacade
    {
        public static ApplicationFacade Facade { get; protected set; }

        public INavigator Navigator { get; set; }

        protected Container Container;
        protected Dictionary<Type, Type> ViewMapper;

        protected abstract void SetupContainer();
        protected abstract void SetupMapping();

        public virtual void Initalize()
        {
            ViewMapper = new Dictionary<Type, Type>();

            SetupMapping();
            SetupContainer();
        }
        
        public Type GetMappedView<T>()
        {
            return ViewMapper.ContainsKey(typeof(T)) ? ViewMapper[typeof(T)] : null;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using Autofac;

namespace SafeCloud.ClientCore.Infrastructure
{
    public abstract class AppResolver
    {
        protected IContainer Container;
        protected Dictionary<Type, Type> ViewMapper;

        protected abstract void SetupContainer();
        protected abstract void SetupMapping();

        protected AppResolver()
        {
            SetupContainer();
            SetupMapping();
        }

        public T Resolve<T>() => Container.Resolve<T>();
        public T Resolve<T>(Action<T> initializationAction)
        {
            var resolved = Resolve<T>();
            initializationAction?.Invoke(resolved);
            return resolved;
        }

        public Type ResolveMappedType<T>()
        {
            if(ViewMapper == null)
                throw new NullReferenceException();
            var firstMappedType = ViewMapper.FirstOrDefault(x => x.Key == typeof(T)).Value;
            return firstMappedType ?? ViewMapper.FirstOrDefault(x => x.Value == typeof(T)).Key;
        }
        public T CreateObject<T>() where T : class => Activator.CreateInstance<T>();
        public object CreateObject(Type type) => Activator.CreateInstance(type);
    }
}

namespace SafeCloud.ClientCore.Infrastructure
{
    public abstract class ApplicationFacade
    {
        public static ApplicationFacade Facade { get; protected set; }

        public AppResolver Resolver { get; protected set; }

        public INavigator Navigator { get; set; }

        protected ApplicationFacade(AppResolver resolver) => Resolver = resolver;
        public virtual void Initalize()
        {
            Navigator = Resolver.Resolve<INavigator>();
        }
    }
}

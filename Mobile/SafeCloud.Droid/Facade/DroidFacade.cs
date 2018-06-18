using System.Threading.Tasks;
using Autofac;
using SafeCloud.ClientCore.Abstractions;
using SafeCloud.ClientCore.MVVM.ViewModels.AuthStructure;
using SafeCloud.Droid.Views;

namespace SafeCloud.Droid.Facade
{
    internal class DroidFacade : ApplicationFacade
    {
        public static void Initialize()
        {
            if (Facade == null)
            {
                Facade = new DroidFacade { Navigator = new DroidNavigator() };
                Facade.Initalize();
            }
        }

        protected override void SetupContainer()
        {
            var builder = new ContainerBuilder();

        }

        protected override void SetupMapping()
        {
            ViewMapper.Add(typeof(AuthorizationViewModel), typeof(AuthorizationView));
        }
        
    }
}
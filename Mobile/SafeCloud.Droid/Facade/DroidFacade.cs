using SafeCloud.ClientCore.Infrastructure;
using SafeCloud.Droid.Infractructure;

namespace SafeCloud.Droid.Facade
{
    internal class DroidFacade : ApplicationFacade
    {
        public static void Initialize()
        {
            if (Facade == null)
            {
                Facade = new DroidFacade();
                Facade.Initalize();
            }
        }

        public DroidFacade() : base(new AndroidAppResolver())
        {
        }
    }
}
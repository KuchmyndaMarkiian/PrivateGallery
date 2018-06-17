using System.Runtime.CompilerServices;
using SafeCloud.ClientCore.Abstractions.Infrastructure;
using SafeCloud.ClientCore.Infrastructure;

namespace SafeCloud.Console
{
    class Program
    {
        private static void Main(string[] args)
        {
            //LoginTest();
            RegisterTest();

            System.Console.ReadKey();
        }

        /// <summary>
        /// http://localhost:57641/Token
        /// </summary>
        private static async void LoginTest()
        {
            LogStart();

            var request = new
            {
                grant_type = "password",
                username = "harrisonford@gmail.com",
                password = "Mark95!"
            };

            IRestClient clientBase = new RestClient();

            await clientBase.Post("http://localhost:57641/Token", null, request, ContentType.Form,
                async message => System.Console.WriteLine(await message.Content.ReadAsStringAsync()),
                async message => System.Console.WriteLine(await message.Content.ReadAsStringAsync()));

            LogFinish();
        }

        /// <summary>
        /// http://localhost:57641/api/Account/Register
        /// </summary>
        private static async void RegisterTest()
        {
            LogStart();

            var request = new
            {
                Email = "mark0611@gmail.com",
                Password = "Mark95!",
                ConfirmPassword = "Mark95!",
                FirstName = "Harrison",
                LastName = "Ford"
            };

            IRestClient clientBase = new RestClient();

            await clientBase.Post("http://localhost:57641/api/Account/Register", null, request, ContentType.Form,
                async message => System.Console.WriteLine(await message.Content.ReadAsStringAsync()),
                async message => System.Console.WriteLine(await message.Content.ReadAsStringAsync()));

            LogFinish();
        }

        private static void LogStart([CallerMemberName] string name = null)
        {
            System.Console.WriteLine($"{name} is started");
        }

        private static void LogFinish([CallerMemberName] string name = null)
        {
            System.Console.WriteLine($"{name} is ended");
        }
    }
}
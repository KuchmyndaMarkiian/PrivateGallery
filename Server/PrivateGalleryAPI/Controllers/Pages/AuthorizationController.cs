using System.Web.Mvc;

namespace SafeCloud.API.Controllers.Pages
{
    public class AuthorizationController : Controller
    {
        public ActionResult Login()
        {
            ViewBag.Title = "Login";
            return View();
        }
    }
}

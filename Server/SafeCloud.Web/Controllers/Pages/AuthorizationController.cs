using System.Web.Mvc;

namespace SafeCloud.Web.Controllers.Pages
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

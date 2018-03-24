using System.Web.Mvc;

namespace SafeCloud.API.Controllers.Pages
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            return View();
        }
    }
}

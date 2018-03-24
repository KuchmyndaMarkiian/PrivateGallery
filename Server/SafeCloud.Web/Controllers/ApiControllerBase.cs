using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using SafeCloud.DAL.Repositories;

namespace SafeCloud.Web.Controllers
{
    public class ApiControllerBase : ApiController
    {
        protected UnitOfWork UnitOfWork { get; } = UnitOfWork.Instance;
    }
}
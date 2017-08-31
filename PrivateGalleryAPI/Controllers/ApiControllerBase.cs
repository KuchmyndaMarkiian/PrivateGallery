using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using PrivateGallery.DAL.Repositories;

namespace PrivateGalleryAPI.Controllers
{
    public class ApiControllerBase : ApiController
    {
        protected UnitOfWork UnitOfWork { get; } = UnitOfWork.Instance;
    }
}
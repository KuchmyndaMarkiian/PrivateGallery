using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.DAL.Infrastructure;

namespace PrivateGalleryAPI.Controllers
{
    [System.Web.Http.Authorize]
    [System.Web.Http.RoutePrefix("api/Gallery")]
    public class GalleryController : ApiControllerBase
    {
        // PUT api/Gallery/
        [System.Web.Http.HttpPut]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<IHttpActionResult> Put(
            [Bind(Exclude = nameof(GalleryBindindModel.NewName))] GalleryBindindModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var user = await UnitOfWork.Users.GetAsync(x => x.UserName == User.Identity.Name);
                if (user == null)
                {
                    throw new NullReferenceException();
                }
                var newItem = new DalEntityCreator().CreateGalleryEntity(model);
                newItem.Header = model.Name;
                user.Galleries.Add(newItem);
                await UnitOfWork.SaveAsync();
                return Ok();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }

        // PATCH api/Gallery/
        [System.Web.Http.HttpPatch]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<IHttpActionResult> Patch(
            [Bind(Exclude = nameof(GalleryBindindModel.DateTime))] GalleryBindindModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var user = await UnitOfWork.Users.GetAsync(x => x.UserName == User.Identity.Name);
                if (user == null)
                {
                    throw new NullReferenceException();
                }
                if (user.Galleries.Any(x => x.Header == model.Name))
                {
                    var found = await UnitOfWork.Gallery.GetAsync(gallery => gallery.Header == model.Name);
                    found.Header = model.NewName;
                    UnitOfWork.Gallery.Update(found);
                    await UnitOfWork.SaveAsync();
                    return Ok();
                }
                return NotFound();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }

        // DELETE api/Gallery
        [System.Web.Http.HttpDelete]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<IHttpActionResult> Delete(
            [FromBody] [Bind(Include = nameof(GalleryBindindModel.Name))] GalleryBindindModel model)
        {
            try
            {
                string username = User.Identity.Name;
                var user = UnitOfWork.Users.Get(x => x.UserName == username);
                if (user == null)
                {
                    return BadRequest("Doesn`t authorized");
                }
                if (user.Galleries.Any(x => x.Header == model.Name))
                {
                    UnitOfWork.Gallery.Delete(gallery => gallery.Header == model.Name);
                    await UnitOfWork.SaveAsync();
                    return Ok();
                }
                return BadRequest("It isn`t found");
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }
    }
}
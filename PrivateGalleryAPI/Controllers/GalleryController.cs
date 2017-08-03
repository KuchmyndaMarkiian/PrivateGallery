using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
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
        // GET api/Gallery?name={}
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(GalleryBindindModel))]
        public async Task<IHttpActionResult> Get(string name)
        {
            var user = await UnitOfWork.Users.GetAsync(x => x.UserName == User.Identity.Name);
            if (user == null)
            {
                throw new NullReferenceException();
            }
            if (user.Galleries.Any(x => x.Header == name))
            {
                var found = user.Galleries.FirstOrDefault(x => x.Header == name);
                return Ok(new GalleryBindindModel {Name = name, DateTime = found.CreatedDate.Value});
            }
            return NotFound();
        }

        // GET api/Gallery/List
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [System.Web.Http.Route("List")]
        [ResponseType(typeof(ICollection<GalleryStructure>))]
        public async Task<IHttpActionResult> List()
        {
            var user = await UnitOfWork.Users.GetAsync(x => x.UserName == User.Identity.Name);
            if (user == null)
            {
                throw new NullReferenceException();
            }
            if (user.Galleries.Any())
            {

                return Ok(user.Galleries.Select(g => new GalleryStructure
                {
                    Name = g.Header,
                    DateTime = g.CreatedDate.Value,
                    Pictures = g.Photos.Select(p => new PictureBindingModel
                    {
                        Name = p.Name,
                        DateTime = p.CreatedDate.Value,
                        Description = p.Description,
                        Geolocation = p.Geolocation
                    })
                }));
            }
            return NotFound();
        }

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
                if (user != null)
                {
                    var newItem = new DalEntityCreator().CreateGalleryEntity(model);
                    newItem.Header = model.Name;
                    newItem.OwnerUser = user;
                    UnitOfWork.Gallery.Create(newItem);
                    await UnitOfWork.SaveAsync();
                    return Ok();
                }
                throw new NullReferenceException();
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
                    string main = AppDomain.CurrentDomain.BaseDirectory;
                    var found = user.Galleries.FirstOrDefault(x => x.Header == model.Name);
                    found.Photos.ForEach(photo =>
                    {
                        File.Delete($"{main}{photo.Path.TrimStart('~')}");
                    });
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
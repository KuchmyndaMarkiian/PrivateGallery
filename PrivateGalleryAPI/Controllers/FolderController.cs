using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.DAL.Entities;
using PrivateGallery.DAL.Infrastructure;
using File = System.IO.File;

namespace PrivateGalleryAPI.Controllers
{
    [System.Web.Http.Authorize]
    [System.Web.Http.RoutePrefix("api/Folder")]
    public class FolderController : ApiControllerBase
    {
        // GET api/Folder?name=()
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(GalleryBindindModel))]
        public async Task<IHttpActionResult> Get(string name)
        {
            var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
            if (user == null)
            {
                return InternalServerError();
            }
            if (user.Galleries.Any(x => x.Header == name))
            {
                var found = user.Galleries.FirstOrDefault(x => x.Header == name);
                return Ok(new GalleryBindindModel
                {
                    Name = name,
                    DateTime = found.CreatedDate.Value,
                    Attribute = new AttributeBindingModel() {HasPublicAccess = found.Attribute.HasPublicAccess}
                });
            }
            return NotFound();
        }

        // GET api/Folder/List
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [System.Web.Http.Route("List")]
        [ResponseType(typeof(ICollection<GalleryStructure>))]
        public async Task<IHttpActionResult> List()
        {
            var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
            if (user == null)
            {
                return InternalServerError();
            }
            if (user.Galleries.Any())
            {
                return Ok(user.Galleries.Select(g => new GalleryStructure
                {
                    Id = g.Id,
                    Name = g.Header,
                    DateTime = g.CreatedDate.Value,
                    Pictures = g.Files.Select(p => new PictureBindingModel
                    {
                        Id = p.Id,
                        Name = p.Header,
                        DateTime = p.CreatedDate.Value,
                        Description = p.Description,
                        Geolocation = p.Geolocation
                    })
                }));
            }
            return NotFound();
        }

        // PUT api/Folder/
        [System.Web.Http.HttpPut]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(string))]
        public async Task<IHttpActionResult> Put(
            [Bind(Exclude = nameof(GalleryBindindModel.NewName))] GalleryBindindModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
                if (user != null)
                {
                    var newItem = DalEntityCreator.CreateGalleryEntity(model);
                    newItem.OwnerUser = user;
                    UnitOfWork.FolderRepository.Create(newItem);
                    UnitOfWork.SaveAsync();
                    return Ok(newItem.Id);
                }
                 return InternalServerError();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }

        // PATCH api/Folder/
        [System.Web.Http.HttpPatch]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(string))]
        public async Task<IHttpActionResult> Patch(
            [Bind(Exclude = nameof(GalleryBindindModel.DateTime))] GalleryBindindModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
                if (user == null)
                {
                    return InternalServerError();
                }
                if (user.Galleries.Any(x => x.Id == model.Id))
                {
                    var found = await UnitOfWork.FolderRepository.GetAsync(gallery => gallery.Id == model.Id);
                    found.Header = model.NewName;
                    UnitOfWork.FolderRepository.Update(found);
                    UnitOfWork.SaveAsync();
                    return Ok("Renamed");
                }
                return NotFound();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }

        // DELETE api/Folder
        [System.Web.Http.HttpDelete]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(string))]
        public async Task<IHttpActionResult> Delete(
            [FromBody] [Bind(Include = nameof(GalleryBindindModel.Id))] GalleryBindindModel model)
        {
            try
            {
                string username = User.Identity.Name;
                var user = UnitOfWork.UserRepository.Get(x => x.UserName == username);
                if (user == null)
                {
                    return BadRequest("Doesn`t authorized");
                }
                if (user.Galleries.Any(x => x.Id == model.Id))
                {
                    UnitOfWork.FolderRepository.Delete(gallery => gallery.Id == model.Id);
                    UnitOfWork.SaveAsync();
                    return Ok("Deleted");
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
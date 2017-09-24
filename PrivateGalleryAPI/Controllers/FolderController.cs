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
using FileStructure = PrivateGallery.Common.BindingModels.FileStructure;

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
        [ResponseType(typeof(FolderBindindModel))]
        public async Task<IHttpActionResult> Get(string id)
        {
            var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
            if (user == null)
            {
                return InternalServerError();
            }
            if (user.Folders.Any(x => x.Id == id))
            {
                var found = user.Folders.FirstOrDefault(x => x.Id == id);
                return Ok(new FolderBindindModel
                {
                    Name = found.Header,
                    Id = id,
                    DateTime = found.CreatedDate.Value,
                    AttributeHasPublicAccess=found.AttributeHasPublicAccess
                });
            }
            return NotFound();
        }

        // GET api/Folder/List
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [System.Web.Http.Route("List")]
        [ResponseType(typeof(ICollection<FileStructure>))]
        public async Task<IHttpActionResult> List()
        {
            var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
            if (user == null)
            {
                return InternalServerError();
            }
            if (user.Folders.Any())
            {
                return Ok(user.Folders.Select(g => new FileStructure
                {
                    Id = g.Id,
                    ParentId = g.ParentFolder?.Id,
                    Name = g.Header,
                    DateTime = g.CreatedDate.Value,
                    AttributeHasPublicAccess = g.AttributeHasPublicAccess,
                    Files = g.Files.Select(p => new FileBindingModel
                    {
                        Id = p.Id,
                        ParentId = p.ParentFolder?.Id,
                        Name = p.Header,
                        DateTime = p.CreatedDate.Value,
                        Description = p.Description,
                        Geolocation = p.Geolocation,
                        AttributeHasPublicAccess = p.AttributeHasPublicAccess,
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
            [Bind(Exclude = nameof(FolderBindindModel.NewName))] FolderBindindModel model)
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
            [Bind(Exclude = nameof(FolderBindindModel.DateTime))] FolderBindindModel model)
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
                if (user.Folders.Any(x => x.Id == model.Id))
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
             [Bind(Include = nameof(FolderBindindModel.Id))] FolderBindindModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                string username = User.Identity.Name;
                var user = UnitOfWork.UserRepository.Get(x => x.UserName == username);
                if (user == null)
                {
                    return BadRequest("Not authorized");
                }
                if (user.Folders.Any(x => x.Id == model.Id))
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
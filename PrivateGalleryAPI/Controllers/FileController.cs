using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.DAL.Entities;
using PrivateGallery.DAL.Infrastructure;
using PrivateGalleryAPI.Infrastructure;

namespace PrivateGalleryAPI.Controllers
{
    [System.Web.Http.Authorize]
    [System.Web.Http.RoutePrefix("api/File")]
    public class FileController : ApiControllerBase
    {
        // GET api/File/Download?gallery=()&photo=()
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("Download")]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<HttpResponseMessage> Download
            (string gallery,string photo)
        {
            string main = AppDomain.CurrentDomain.BaseDirectory;
            string userName = User.Identity.Name;
            if (string.IsNullOrEmpty(userName))
            {
                return new HttpResponseMessage(HttpStatusCode.NoContent);
            }
            var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == userName);
            if (user != null && user.Folders.Any(g => g.Header == gallery && g.Files.Any(p => p.Header == photo)))
            {
                var gal = user.Folders.FirstOrDefault(g => g.Header == gallery);
                var found = gal.Files.FirstOrDefault(p => p.Header == photo);
                var file = $"{main}{found.Path.TrimStart('~')}";
                return await StreamManager.GetStreamContent(file);
            }
            return new HttpResponseMessage(HttpStatusCode.NotFound);
        }
        // GET api/File?gallery=()&photo=()
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(FileBindingModel))]
        public async Task<IHttpActionResult> Get
            (string gallery, string photo)
        {
            string userName = User.Identity.Name;
            if (string.IsNullOrEmpty(userName))
            {
                return NotFound();
            }
            var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == userName);
            if (user != null && user.Folders.Any(g => g.Header == gallery && g.Files.Any(p => p.Header == photo)))
            {
                var gal = user.Folders.FirstOrDefault(g => g.Header == gallery);
                var found = gal.Files.FirstOrDefault(p => p.Header == photo);
                return Ok(new FileBindingModel
                {
                    Name = found.Header,
                    DateTime = found.CreatedDate.Value,
                    Description = found.Description,
                    Geolocation = found.Geolocation,
                    
                });
            }
            return NotFound();
        }

        // PUT api/File/
        [System.Web.Http.HttpPut]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(string))]
        public async Task<IHttpActionResult> Put(
            [Bind(Exclude = nameof(FileBindingModel.NewName))] FileBindingModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var newItem = DalEntityCreator.CreatePhotoEntity(model);
                UnitOfWork.FileRepository.Create(newItem);
                UnitOfWork.SaveAsync();
                return Ok(newItem.Id);
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }
        // PATCH api/File/
        [System.Web.Http.HttpPatch]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(string))]
        public async Task<IHttpActionResult> Patch(
            [Bind(Exclude = nameof(FileBindingModel.DateTime))] FileBindingModel model)
        {
            var func = new Func<Folder, bool>(gallery => gallery.Id == model.Id);
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var user = await UnitOfWork.UserRepository.GetAsync(x => x.UserName == User.Identity.Name);
                if (!user.Folders.Any(func) ||
                    user.Folders.Any(x => x.Files.Any(p => p.Id == model.Id)))
                {
                    return NotFound();
                }
                var foundGallery =await UnitOfWork.FolderRepository.GetAsync(gallery => gallery.Id == model.Id && gallery.OwnerUser.UserName == user.UserName);
                var editedItem = foundGallery.Files.FirstOrDefault(p => p.Id == model.Id);
                editedItem.Header = model.NewName;
                editedItem.CreatedDate = model.DateTime;
                editedItem.Description = model.Description;
                editedItem.Geolocation = model.Geolocation;
                editedItem.AttributeHasPublicAccess = model.AttributeHasPublicAccess;
                UnitOfWork.FileRepository.Update(editedItem);
                UnitOfWork.SaveAsync();
                return Ok("Updated");
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }
        // DELETE api/File
        [System.Web.Http.HttpDelete]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(string))]
        public async Task<IHttpActionResult> Delete(
            [FromBody] [Bind(Include = "Id")] FileBindingModel model)
        {
            try
            {
                string username = User.Identity.Name;
                var user = UnitOfWork.UserRepository.Get(x => x.UserName == username);
                if (user == null)
                {
                    return BadRequest("Doesn`t authorized");
                }
                UnitOfWork.FileRepository.Delete(x=>x.Id==model.Id);
                UnitOfWork.SaveAsync();
                return Ok("Deleted");
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }
        // POST api/File
        [System.Web.Http.HttpPost, HostAuthentication(DefaultAuthenticationTypes.ExternalBearer),
         ValidateAntiForgeryToken]
        public async Task<IEnumerable<string>> Post()
        {
            string folderName = "App_Data\\PrivatePictures";
            string path = HttpContext.Current.Server.MapPath("~\\" + folderName);
            var name = User.Identity.GetUserName().Split('@').First();
            var obj = new object();
            if (Request.Content.IsMimeMultipartContent())
            {
                var streamProvider = new CustomMultipartFormDataStreamProvider(path);
                var task = Request.Content.ReadAsMultipartAsync(streamProvider)
                    .ContinueWith(t =>
                    {
                        if (t.IsCanceled)
                        {
                            throw new HttpResponseException(HttpStatusCode.InternalServerError);
                        }
                        var fileInfo = streamProvider.FileData.Select(i =>
                        {
                            var info = new FileInfo(i.LocalFileName);
                            var filePath = folderName + "\\" + info.Name;
                            var fileId = i.Headers.ContentDisposition.Name.Replace("\"","");
                            lock (obj)
                            {
                                var user = UnitOfWork.UserRepository.Get(u => u.UserName.Split('@').First() == name);
                                var found = UnitOfWork.FileRepository.Get(p => p.Id == fileId);
                                if (user != null && found!=null)
                                {
                                    found.Path = "~\\" + filePath;
                                    UnitOfWork.FileRepository.Update(found);
                                }
                                UnitOfWork.Save();
                            }
                            return "Saved";
                        });
                        return fileInfo;
                    });
                return await task;
            }
            throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotAcceptable,
                "This request is not properly formatted"));
        }
    }
}

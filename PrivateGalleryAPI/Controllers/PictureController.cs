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
using PrivateGalleryAPI.Models;

namespace PrivateGalleryAPI.Controllers
{
    [System.Web.Http.Authorize]
    [System.Web.Http.RoutePrefix("api/Picture")]
    public class PictureController : ApiControllerBase
    {
        // GET api/Picture/Download?gallery={}&photo={}
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
            var user = await UnitOfWork.Users.GetAsync(x => x.UserName == userName);
            if (user != null && user.Galleries.Any(g => g.Header == gallery && g.Photos.Any(p => p.Name == photo)))
            {
                var gal = user.Galleries.FirstOrDefault(g => g.Header == gallery);
                var found = gal.Photos.FirstOrDefault(p => p.Name == photo);
                var file = $"{main}{found.Path.TrimStart('~')}";
                return await StreamManager.GetStreamContent(file);
            }
            return new HttpResponseMessage(HttpStatusCode.NotFound);
        }
        // GET api/Picture?gallery={}&photo={}
        [System.Web.Http.HttpGet]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        [ResponseType(typeof(PictureBindingModel))]
        public async Task<IHttpActionResult> Get
            (string gallery, string photo)
        {
            string userName = User.Identity.Name;
            if (string.IsNullOrEmpty(userName))
            {
                return NotFound();
            }
            var user = await UnitOfWork.Users.GetAsync(x => x.UserName == userName);
            if (user != null && user.Galleries.Any(g => g.Header == gallery && g.Photos.Any(p => p.Name == photo)))
            {
                var gal = user.Galleries.FirstOrDefault(g => g.Header == gallery);
                var found = gal.Photos.FirstOrDefault(p => p.Name == photo);
                return Ok(new PictureBindingModel
                {
                    Name = found.Name,
                    DateTime = found.CreatedDate.Value,
                    Description = found.Description,
                    Geolocation = found.Geolocation
                });
            }
            return NotFound();
        }

        // PUT api/Picture/
        [System.Web.Http.HttpPut]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<IHttpActionResult> Put(
            [Bind(Exclude = nameof(PictureBindingModel.NewName))] PictureBindingModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var user = await UnitOfWork.Users.GetAsync(x => x.UserName == User.Identity.Name);
                if (user == null || user.Galleries.All(gallery => gallery.Header != model.GalleryName))
                {
                    throw new NullReferenceException();
                }
                var foundGallery = await UnitOfWork.Gallery.GetAsync(gallery => gallery.Header == model.GalleryName && gallery.OwnerUser.UserName==user.UserName);
                var newItem = new DalEntityCreator().CreatePhotoEntity();
                newItem.Name = model.Name;
                newItem.Description = model.Description;
                newItem.Geolocation = model.Geolocation;
                newItem.CreatedDate = model.DateTime;
                newItem.Folder = foundGallery;
                UnitOfWork.Photos.Create(newItem);
                await UnitOfWork.SaveAsync();
                return Ok();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }

        // PATCH api/Picture/
        [System.Web.Http.HttpPatch]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<IHttpActionResult> Patch(
            [Bind(Exclude = nameof(PictureBindingModel.DateTime))] PictureBindingModel model)
        {
            var func = new Func<Gallery, bool>(gallery => gallery.Header == model.GalleryName);
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
                if (!user.Galleries.Any(func) ||
                    user.Galleries.Any(x => x.Photos.Any(p => p.Name == model.Name)))
                {
                    return NotFound();
                }
                var foundGallery =await UnitOfWork.Gallery.GetAsync(gallery => gallery.Header == model.GalleryName && gallery.OwnerUser.UserName == user.UserName);
                var editedItem = foundGallery.Photos.FirstOrDefault(p => p.Name == model.Name);
                editedItem.Name = model.NewName;
                editedItem.CreatedDate = model.DateTime;
                editedItem.Description = model.Description;
                editedItem.Geolocation = model.Geolocation;
                UnitOfWork.Photos.Update(editedItem);
                await UnitOfWork.SaveAsync();
                return Ok();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }

        // DELETE api/Picture
        [System.Web.Http.HttpDelete]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [ValidateAntiForgeryToken]
        public async Task<IHttpActionResult> Delete(
            [FromBody] [Bind(Include = "GalleryName,Name")] PictureBindingModel model)
        {
            try
            {
                string username = User.Identity.Name;
                var user = UnitOfWork.Users.Get(x => x.UserName == username);
                if (user == null)
                {
                    return BadRequest("Doesn`t authorized");
                }
                string main = AppDomain.CurrentDomain.BaseDirectory;
                var path=UnitOfWork.Photos.Get(photo => photo.Folder.OwnerUser.UserName == user.UserName &&
                                               photo.Folder.Header == model.GalleryName && photo.Name == model.Name).Path;
                var file = $"{main}{path.TrimStart('~')}";
                File.Delete(file);
                UnitOfWork.Photos.Delete(photo => photo.Folder.OwnerUser.UserName == user.UserName &&
                                                  photo.Folder.Header == model.GalleryName && photo.Name == model.Name);
                await UnitOfWork.SaveAsync();

                return Ok();
            }
            catch (Exception e)
            {
                return InternalServerError(e);
            }
        }


        // POST api/Picture
        [System.Web.Http.HttpPost, HostAuthentication(DefaultAuthenticationTypes.ExternalBearer),
         ValidateAntiForgeryToken]
        public async Task<IEnumerable<UploadedFile>> Post()
        {
            string folderName = "App_Data\\PrivatePictures";
            string path = HttpContext.Current.Server.MapPath("~\\" + folderName);
            string rootUrl = Request.RequestUri.AbsoluteUri.Replace(Request.RequestUri.AbsolutePath, string.Empty);
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
                            var galleryName = i.Headers.ContentDisposition.Name.Replace("\"","");
                            var photoName = info.Name;
                            lock (obj)
                            {
                                var user = UnitOfWork.Users.Get(u => u.UserName.Split('@').First() == name);
                                if (user != null &&
                                    user.Galleries.Any(g => g.Header == galleryName &&
                                                            g.Photos.Any(p => p.Name == photoName)))
                                {
                                    var found = user.Galleries.FirstOrDefault(x => x.Header == galleryName).Photos.FirstOrDefault(p=>p.Name==photoName);
                                    found.Path = "~\\" + filePath;
                                    UnitOfWork.Photos.Update(found);
                                }
                                UnitOfWork.Save();
                            }
                            return new UploadedFile(info.Name, rootUrl + '\\' + filePath, info.Length / 1024);
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

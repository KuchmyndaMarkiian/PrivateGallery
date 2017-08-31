using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Android.Util;
using PrivateGallery.Common.BindingModels;
using Exception = System.Exception;

namespace PrivateGallery.Android.Infrastructure
{
    /// <summary>
    /// Storaging Cloud System with managing data
    /// </summary>
    public class PrivateGalleryCloudSystem : IDisposable
    {
        private readonly HttpManager _httpManager;

        public PrivateGalleryCloudSystem(HttpManager httpManager)
        {
            _httpManager = httpManager;
        }

        #region Galleries
        /// <summary>
        /// Gets list of existing galleries
        /// </summary>
        /// <returns></returns>
        public async Task<List<GalleryStructure>> DownloadGalleries()
        {
            try
            {
                return await _httpManager.GetData<List<GalleryStructure>>(Settings.GalleryListAdress);
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return null;
            }
        }

        /// <summary>
        /// Creates Gallery on server (PUT method)
        /// </summary>
        /// <param name="name"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public async Task<bool> CreateGallery(string name, DateTime dateTime)
        {
            try
            {
                return await _httpManager.OperateData(new GalleryBindindModel {Name = name, DateTime = dateTime},
                    Settings.GalleryAdress, HttpMethod.Put);
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }
        /// <summary>
        /// Updates gallery
        /// </summary>
        /// <param name="name"></param>
        /// <param name="newName"></param>
        /// <returns></returns>
        public async Task<bool> UpdateGallery(string name, string newName)
        {
            try
            {
                return await _httpManager.OperateData(new GalleryBindindModel {Name = name, NewName = newName},
                    Settings.GalleryAdress, new HttpMethod("PATCH"));
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }
        /// <summary>
        /// Deletes gallery from server
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public async Task<bool> DeleteGallery(string name)
        {
            try
            {
                return await _httpManager.OperateData(new GalleryBindindModel {Name = name},
                    Settings.GalleryAdress, HttpMethod.Delete);
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }

        #endregion

        #region Pictures
        /// <summary>
        /// Creates picture on server
        /// </summary>
        /// <param name="name"></param>
        /// <param name="galleryName"></param>
        /// <param name="dateTime"></param>
        /// <param name="description"></param>
        /// <param name="geolocation"></param>
        /// <returns></returns>
        public async Task<bool> CreatePicture(string name, string galleryName, DateTime dateTime, string description,
            string geolocation)
        {
            try
            {
                return await _httpManager.OperateData(
                    new PictureBindingModel()
                    {
                        Name = name,
                        DateTime = dateTime,
                        Description = description,
                        Geolocation = geolocation,
                        GalleryName = galleryName
                    },
                    Settings.PictureAdress, HttpMethod.Put);
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }
        /// <summary>
        /// Updates picture on server
        /// </summary>
        /// <param name="name"></param>
        /// <param name="galleryName"></param>
        /// <param name="description"></param>
        /// <param name="geolocation"></param>
        /// <returns></returns>
        public async Task<bool> UpdatePicture(string name, string galleryName, string description, string geolocation)
        {
            try
            {
                return await _httpManager.OperateData(
                    new PictureBindingModel
                    {
                        Name = name,
                        GalleryName = galleryName,
                        Description = description,
                        Geolocation = geolocation
                    },
                    Settings.PictureAdress, new HttpMethod("PATCH"));
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }
        /// <summary>
        /// Deletes picture from server
        /// </summary>
        /// <param name="name"></param>
        /// <param name="galleryName"></param>
        /// <returns></returns>
        public async Task<bool> DeletePicture(string name, string galleryName)
        {
            try
            {
                return await _httpManager.OperateData(new PictureBindingModel {Name = name, GalleryName = galleryName},
                    Settings.PictureAdress, HttpMethod.Delete);
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }
        /// <summary>
        /// Downloads picture file from server
        /// </summary>
        /// <param name="gallery"></param>
        /// <param name="name"></param>
        /// <returns>Picture in Stream</returns>
        public async Task<Stream> DownloadPicture(string gallery, string name)
        {
            try
            {
                return await _httpManager.GetFile($@"{Settings.DownloadPictureAdress}?gallery={gallery}&photo={name}");
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return null;
            }
        }
        /// <summary>
        /// Uploads photo on server
        /// </summary>
        /// <param name="pack"></param>
        /// <returns></returns>
        public bool UploadPicture(HttpManager.StreamPack pack)
        {
            try
            {
                return _httpManager.PostFile(Settings.PictureAdress, pack);
            }
            catch (Exception exception)
            {
                Log.Error("Cloud", exception.Message);
                return false;
            }
        }

        #endregion
        public void Dispose()
        {
            _httpManager?.Dispose();
        }
    }
}
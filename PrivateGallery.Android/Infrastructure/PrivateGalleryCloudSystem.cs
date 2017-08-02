using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using PrivateGallery.Common.BindingModels;
using Task = Microsoft.Build.Utilities.Task;

namespace PrivateGallery.Android.Infrastructure
{
    class PrivateGalleryCloudSystem:IDisposable
    {
        private HttpManager _httpManager;

        public PrivateGalleryCloudSystem(HttpManager httpManager)
        {
            _httpManager = httpManager;
        }

        public async Task<List<GalleryStructure>> DownloadGalleries()
        {
            try
            {
                return await _httpManager.GetData<List<GalleryStructure>>(Settings.GalleryListAdress);
            }
            catch(Exception e)
            {
                return null;
            }
        }

        public async Task<Stream> DownloadPicture(string gallery, string name)
        {
            try
            {
                return await _httpManager.GetFile($@"{Settings.DownloadPhotoAdress}?gallery={gallery}&photo={name}");
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public void Dispose()
        {
            _httpManager?.Dispose();
        }
    }
}
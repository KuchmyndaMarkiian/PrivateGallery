using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using PrivateGallery.Common.BindingModels;

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

        public void Dispose()
        {
            _httpManager?.Dispose();
        }
    }
}
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;

namespace PrivateGalleryAPI.Infrastructure
{
    public class StreamManager
    {
        public static async Task<HttpResponseMessage> GetStreamContent(string file)
        {
            return await Task.Run(() =>
            {
                HttpResponseMessage response = new HttpResponseMessage
                {
                    Content = new StreamContent(new FileStream(file,
                        FileMode
                            .Open))
                };
                // this file stream will be closed by lower layers of web api for you once the response is completed.
                response.Content.Headers.ContentType = new MediaTypeHeaderValue($"image/{file.Split('.').Last()}");
                return response;
            });
        }
    }
}
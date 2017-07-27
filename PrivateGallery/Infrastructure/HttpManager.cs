using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Exception = Java.Lang.Exception;

namespace PrivateGallery.Infrastructure
{
    public class HttpManager:IDisposable
    {
        private readonly HttpClient _client;
        private string _hostUrl;
        public string AccessToken { get; set; }

        public HttpManager(string hostUrl)
        {
            _client = new HttpClient {Timeout = new TimeSpan(0, 0, 60)};
            _hostUrl = hostUrl;
        }

        public async Task<T> GetData<T>(string url)
        {
            if (string.IsNullOrEmpty(url))
                return default(T);
            try
            {
                var requestMessage = HttpMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, $"{_hostUrl}{url}", AccessToken);
                var responseMessage = await _client.SendAsync(requestMessage);
                return responseMessage.IsSuccessStatusCode
                    ? JsonConvert.DeserializeObject<T>(await responseMessage.Content.ReadAsStringAsync())
                    : default(T);
            }
            catch (Exception exception)
            {
                return default(T);
            }
        }
        public async Task<Stream> GetFile(string url)
        {
            if (string.IsNullOrEmpty(url))
                return default(Stream);
            try
            {
                var requestMessage = HttpMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, url, AccessToken);
                var responseMessage = await _client.SendAsync(requestMessage);
                return responseMessage.IsSuccessStatusCode
                    ? await responseMessage.Content.ReadAsStreamAsync()
                    : default(Stream);
            }
            catch (Exception exception)
            {
                return default(Stream);
            }
        }

        public void Dispose()
        {
            _client?.Dispose();
        }
    }
}
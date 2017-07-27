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
                var responseMessage =  _client.SendAsync(requestMessage).Result;
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
                var requestMessage = HttpMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, $"{_hostUrl}{url}", AccessToken);
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
        //todo It doesn't works
        public bool PostFile(string url, (string fullname, string name, Stream content) file)
        {
            try
            {
                Console.WriteLine("Start Uploading");
                if (string.IsNullOrEmpty(url))
                    throw new NullReferenceException(nameof(url) + "isn`t correct");
                Console.WriteLine("Norm URL");
                var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{_hostUrl}{url}");
                var content = new MultipartFormDataContent();
                content.Add(new StreamContent(file.content), file.name, file.fullname);
                Console.WriteLine("Content Added");
                requestMessage.Content = content;
                Console.WriteLine("Sending");
                var responseMessage = _client.SendAsync(requestMessage).Result;
                Console.WriteLine("Done");
                return responseMessage.IsSuccessStatusCode;
            }
            catch (Exception exception)
            {
                return false;
            }
        }

        public void Dispose()
        {
            _client?.Dispose();
        }
    }
}
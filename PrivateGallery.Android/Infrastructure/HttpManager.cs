using System;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Android.Util;
using Newtonsoft.Json;
using Exception = Java.Lang.Exception;

namespace PrivateGallery.Android.Infrastructure
{
    public class HttpManager : IDisposable
    {
        private readonly HttpClient _client;
        private readonly string _hostUrl;
        public string AccessToken { get; set; }

        public HttpManager(string hostUrl)
        {
            _client = new HttpClient {Timeout = new TimeSpan(0, 0, 60)};
            _hostUrl = hostUrl;
        }

        public async Task<T> GetData<T>(string url)
        {
            try
            {
                if (string.IsNullOrEmpty(url))
                    throw new NullReferenceException();
                var requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, $"{_hostUrl}{url}",
                        AccessToken);
                var responseMessage = _client.SendAsync(requestMessage).Result;
                return responseMessage.IsSuccessStatusCode
                    ? JsonConvert.DeserializeObject<T>(await responseMessage.Content.ReadAsStringAsync())
                    : default(T);
            }
            catch (Exception exception)
            {
                Log.Error("Http", exception, exception.Message);
                return default(T);
            }
        }

        public async Task<Stream> GetFile(string url)
        {
            try
            {
                if (string.IsNullOrEmpty(url))
                    throw new NullReferenceException();
                var requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, $"{_hostUrl}{url}",
                        AccessToken);
                var responseMessage = _client.SendAsync(requestMessage).Result;
                return responseMessage.IsSuccessStatusCode
                    ? await responseMessage.Content.ReadAsStreamAsync()
                    : default(Stream);
            }
            catch (Exception exception)
            {
                Log.Error("Http", exception, exception.Message);
                return default(Stream);
            }
        }

        public async Task<bool> OperateData<T>(T model, string url, HttpMethod method)
        {
            try
            {
                if (string.IsNullOrEmpty(url))
                    throw new NullReferenceException();
                var requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(method, $"{_hostUrl}{url}", AccessToken);
                requestMessage.Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8,
                    Settings.Instance.MimeJson);
                var responseMessage = await _client.SendAsync(requestMessage);
                return responseMessage.IsSuccessStatusCode;
            }
            catch (Exception exception)
            {
                Log.Error("Http", exception, exception.Message);
                return false;
            }
        }


        public class StreamPack
        {
            public string FullName { get; set; }
            public string Name { get; set; }
            public byte[] Stream { get; set; }
        }

        public bool PostFile(string url, StreamPack file)
        {
            try
            {
                if (string.IsNullOrEmpty(url))
                    throw new NullReferenceException(nameof(url) + "isn`t correct");
                var requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Post, $"{_hostUrl}{url}",
                        AccessToken);
                var content = new MultipartFormDataContent
                {
                    {new StreamContent(new MemoryStream(file.Stream)), file.Name, file.FullName}
                };
                requestMessage.Content = content;
                var responseMessage = _client.SendAsync(requestMessage).Result;
                return responseMessage.IsSuccessStatusCode;
            }
            catch (Exception exception)
            {
                Log.Error("Http", exception, exception.Message);
                return false;
            }
        }

        public void Dispose()
        {
            _client?.Dispose();
        }
    }
}
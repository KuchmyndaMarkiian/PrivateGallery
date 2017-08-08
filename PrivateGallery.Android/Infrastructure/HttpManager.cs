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
    /// <summary>
    /// Simpler access to API Resources
    /// </summary>
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

        /// <summary>
        /// Get any object
        /// </summary>
        /// <typeparam name="T">type of object</typeparam>
        /// <param name="url">secondary url</param>
        /// <returns></returns>
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

        /// <summary>
        /// Get any file
        /// </summary>
        /// <param name="url"></param>
        /// <returns>Stream file</returns>
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

        /// <summary>
        /// Operating data with some methods: PATH,DELETE,PUT
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="model">any model</param>
        /// <param name="url"></param>
        /// <param name="method">Http Method</param>
        /// <returns></returns>
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

        /// <summary>
        /// Store file on server
        /// </summary>
        /// <param name="url"></param>
        /// <param name="file"></param>
        /// <returns></returns>
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
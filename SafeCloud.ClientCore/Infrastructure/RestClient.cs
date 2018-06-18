using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using SafeCloud.ClientCore.Abstractions;

namespace SafeCloud.ClientCore.Infrastructure
{
    public class RestClient : IRestClient
    {
        public Task Post(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction = null)
        {
            return Send(HttpMethod.Post, endPoint, headers, requestBody, requestBodyType, successAction, errorAction);
        }

        public Task Get(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction, Action<HttpResponseMessage> errorAction = null)
        {
            return Send(HttpMethod.Get, endPoint, headers, requestBody, requestBodyType, successAction, errorAction);
        }

        public Task Put(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction, Action<HttpResponseMessage> errorAction = null)
        {
            return Send(HttpMethod.Put, endPoint, headers, requestBody, requestBodyType, successAction, errorAction);
        }

        public Task Patch(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction, Action<HttpResponseMessage> errorAction = null)
        {
            return Send(new HttpMethod("PATCH"), endPoint, headers, requestBody, requestBodyType, successAction,
                errorAction);
        }

        public Task Delete(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction, Action<HttpResponseMessage> errorAction = null)
        {
            return Send(HttpMethod.Delete, endPoint, headers, requestBody, requestBodyType, successAction, errorAction);
        }

        public async Task Send(HttpMethod method, string endPoint, Headers headers, object requestBody,
            ContentType requestBodyType, Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    var requestMessage = new HttpRequestMessage(method, endPoint);
                    PutHeaders(requestMessage, headers);
                    PutBody(requestMessage, requestBody, requestBodyType);


                    var response = await client.SendAsync(requestMessage);
                    if (response.IsSuccessStatusCode)
                        successAction?.Invoke(response);
                    else
                        errorAction?.Invoke(response);
                }
            }
            catch (Exception ex)
            {
                errorAction?.Invoke(new HttpResponseMessage {Content = new StringContent(ex.Message)});
            }
        }

        private static void PutHeaders(HttpRequestMessage requestMessage, Headers headers)
        {
            if (headers == null || !headers.Any())
                return;
            foreach (var header in headers)
                requestMessage.Headers.Add(header.Key, header.Value);
        }

        private static void PutBody(HttpRequestMessage requestMessage, object requestBody, ContentType contentType)
        {
            var stringBody = JsonConvert.SerializeObject(requestBody);
            if (contentType == ContentType.Json)
                requestMessage.Content = new StringContent(stringBody);
            else
                requestMessage.Content =
                    new FormUrlEncodedContent(JsonConvert.DeserializeObject<Dictionary<string, string>>(stringBody));
        }
    }
}
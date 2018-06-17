using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace SafeCloud.ClientCore.Abstractions.Infrastructure
{
    public interface IRestClient
    {
        Task Post(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction = default(Action<HttpResponseMessage>));

        Task Get(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction = default(Action<HttpResponseMessage>));

        Task Put(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction = default(Action<HttpResponseMessage>));

        Task Patch(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction = default(Action<HttpResponseMessage>));

        Task Delete(string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction,
            Action<HttpResponseMessage> errorAction = default(Action<HttpResponseMessage>));

        Task Send(HttpMethod method, string endPoint, Headers headers, object requestBody, ContentType requestBodyType,
            Action<HttpResponseMessage> successAction, Action<HttpResponseMessage> errorAction);
    }

    public enum ContentType
    {
        Form,
        Json
    }

    public class Headers : Dictionary<string, string>
    {
    }

    public class Parametrs : Headers
    {
    }
}
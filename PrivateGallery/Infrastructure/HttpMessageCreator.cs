using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;

namespace PrivateGallery.Infrastructure
{
    internal static class HttpMessageCreator
    {
        /// <summary>
        /// Returns full http token header to get some datas from server.
        /// </summary>
        /// <param name="method">Get/Post/etc</param>
        /// <param name="uri">segond segment of Url(not host url)</param>
        /// <param name="accessToken">user`s access token</param>
        /// <returns>HTTP message</returns>
        public static HttpRequestMessage CreateHeaderRequestMessage(HttpMethod method, string uri,
            string accessToken = null)
        {
            var requestMessage = new HttpRequestMessage(method,uri);
            if (accessToken != null)
            {
                requestMessage.Headers.Authorization =
                    new AuthenticationHeaderValue("Bearer", accessToken);
            }
            return requestMessage;
        }
    }
}
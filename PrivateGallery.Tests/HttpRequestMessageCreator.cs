using System.Net.Http;
using System.Net.Http.Headers;

namespace PrivateGallery.Tests
{
    public static class HttpRequestMessageCreator
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
            var requestMessage = new HttpRequestMessage(method, uri);
            if (accessToken != null)
            {
                requestMessage.Headers.Authorization =
                    new AuthenticationHeaderValue("Bearer", accessToken);
            }
            return requestMessage;
        }
    }
}
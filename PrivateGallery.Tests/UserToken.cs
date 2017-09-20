using System;
using Newtonsoft.Json;

namespace PrivateGallery.Tests
{
    /// <summary>
    /// User  token for access resources on host
    /// </summary>
    public sealed class UserToken
    {
        [JsonProperty("access_token")]
        public string AccessToken { get; set; }

        [JsonProperty("token_type")]
        public string TokenType { get; set; }

        [JsonProperty("userName")]
        public string UserName { get; set; }

        [JsonProperty(".expires")]
        public DateTime Expires { get; set; }
    }
}

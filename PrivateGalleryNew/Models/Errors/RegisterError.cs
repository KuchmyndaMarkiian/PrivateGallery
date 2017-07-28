using System.Collections.Generic;
using Newtonsoft.Json;

namespace PrivateGalleryNew.Models.Errors
{
    public class ModelState
    {
        [JsonProperty("")]
        public IList<string> Messages { get; set; }
    }

    /// <summary>
    /// For deserializing wrong response message on Register()
    /// </summary>
    public class RegisterError
    {
        public string Message { get; set; }
        public ModelState ModelState { get; set; }
    }
}

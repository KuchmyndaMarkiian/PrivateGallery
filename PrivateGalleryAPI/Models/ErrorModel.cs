using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace PrivateGalleryAPI.Models
{
    public class ErrorModel
    {
        [JsonProperty("error_description")]
        public string ErrorDescription { get; set; }
    }
}
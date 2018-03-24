using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace SafeCloud.API.Models
{
    public class ErrorModel
    {
        [JsonProperty("error_description")]
        public string ErrorDescription { get; set; }
    }
}
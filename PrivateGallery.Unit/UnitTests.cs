using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using NUnit.Framework;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Unit
{
    [TestFixture]
    public partial class UnitTests
    {
        private readonly string _email = "harrisonford@gmail.com";
        private readonly string _password = "Mark95!";
        private readonly string _host = "http://192.168.0.106:57643";
        private readonly string _gallery = "/api/Gallery";
        private readonly string _picture = "/api/Picture";
        private readonly string _oldName = "Cars";
        private readonly string _newName = "Hype-Cars";
        private string MimeJson => "application/json";

        private readonly string _token =
                "JTNhb0AEbl0dx7e0jzsWK16W7Jm_6NsEl-ZQw8zbMrMQqUZrdgMlfqMvLPU64VT6s502a8Erv0d8SKMotTKmPSYcfYo011yUIKSmh-mjDAB2MAA18W7BPNmZq9PSRCnX9um18L8vW97Oh0-rfrgDJr4OL1YWAbtCsa5T9d22N-d5NfkS-m7tsCrW3j9RYGOYSDcbLTSjkuXeininJvMFuf1UYFG8DOQfjiHCJV4mwtZIJleeREqEC37PDuAN-CFa4P-ugDOlGE5EHVV1sNBNcpxn_Vf98WIrdXfqBaK6moQgM4ropI0g-SCMcLoeUxVkt4JWHjOcI1PahbqKo-Rj-O8f5UBE53N6UE16EKMzhdMpYPJFJIRsUUwV0R7svfL6O_QzChesSAW81wecb_cjukEKRfVuxX0x5JV_qpYJ7pOVb8qRH04WvM45hcmo9CT88RditdAKpUnE5l51wnw58u6bvraiwiPhLMQQmeS1nuPAASgbCPDw0nkBiFpuRJEM"
            ;


        /// <summary>
        /// #1 Get concrete user`s authorization token 
        /// </summary>
        [Test]
        public void GetToken()
        {
            var pairs = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("grant_type", "password"),
                new KeyValuePair<string, string>("username", _email),
                new KeyValuePair<string, string>("Password", _password)
            };
            var content = new FormUrlEncodedContent(pairs);
            dynamic res;
            Send();

            Assert.IsTrue(res is UserToken);


            void Send()
            {
                using (var client = new HttpClient())
                {
                    var _responseMessage =
                        client.PostAsync(_host + "/token",
                                content)
                            .Result;
                    String result = _responseMessage.Content.ReadAsStringAsync().Result;
                    if (_responseMessage.IsSuccessStatusCode)
                    {
                        res = JsonConvert.DeserializeObject<UserToken>(result);
                        return;
                    }
                    string key = "error_description";
                    var messageDictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(result);
                    if (messageDictionary.ContainsKey(key))
                    {
                        res = messageDictionary[key];
                    }
                    else
                    {
                        res = "Server error";
                    }
                }
            }
        }
        /// <summary>
        /// #2  Are obtained data correct?
        /// </summary>
        [Test]
        public void IsCorrectUserInfo()
        {
            string url = "/api/Account/AccountInfo";
            HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Get, _host + url);
            requestMessage.Headers.Authorization = new AuthenticationHeaderValue("Bearer", _token);

            string key = "Email";
            Dictionary<string, string> dictionary = null;
            Send();


            Assert.IsTrue(dictionary.Any() && dictionary.ContainsKey(key) && dictionary[key] == _email);

            void Send()
            {
                using (var client = new HttpClient())
                {
                    var response = client.SendAsync(requestMessage).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        dictionary =
                            JsonConvert.DeserializeObject<Dictionary<string, string>>(response.Content
                                .ReadAsStringAsync()
                                .Result);
                    }
                    else
                    {
                        dictionary = new Dictionary<string, string>()
                        {
                            {"error", "error"}
                        };
                    }
                }
            }

        }
        /// <summary>
        /// #3 Restore user password
        /// </summary>
        [Test]
        public void RestorePassword()
        {
            RestorePasswordBindingModel model =
                new RestorePasswordBindingModel()
                {
                    Email = _email,
                    ConfirmPassword = _password,
                    NewPassword = _password
                };
            HttpResponseMessage message;
            Send();

            Assert.IsTrue(message.IsSuccessStatusCode);



            void Send()
            {
                using (var client = new HttpClient())
                {
                    message = client.PostAsync(_host + "/api/Account/RestorePassword",
                            new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8,
                                MimeJson))
                        .Result;
                }
            }
        }
        /// <summary>
        /// #4 Create new Gallery
        /// </summary>
        [Test]
        public void CreateGallery()
        {
            GalleryBindindModel model = new GalleryBindindModel {DateTime = DateTime.Now, Name = _oldName};
            Assert.IsTrue(OperateData( model,_gallery,new HttpClient(),HttpMethod.Put ));
        }
        /// <summary>
        /// #5 Renaming Gallery
        /// </summary>
        [Test]
        public void RenameGallery()
        {
            GalleryBindindModel model = new GalleryBindindModel { DateTime = DateTime.Now, Name = _oldName,NewName = _newName};
            Assert.IsTrue(OperateData(model, _gallery, new HttpClient(), new HttpMethod("PATCH")));
        }
        /// <summary>
        /// #6 Get a renamed gallery
        /// </summary>
        [Test]
        public void GetConcreteGallery()
        {
            GalleryBindindModel model=new GalleryBindindModel();
            Send();

            Assert.IsTrue(model.Name==_newName);

            void Send()
            {
                var param= $"/api/Gallery?name={_newName}";
                HttpRequestMessage requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get,
                        $"{_host}{param}", _token);
                using (var client=new HttpClient())
                {
                    var response = client.SendAsync(requestMessage).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        model =
                            JsonConvert.DeserializeObject<GalleryBindindModel>(response.Content.ReadAsStringAsync()
                                .Result);
                    }
                }
            }
        }

        /// <summary>
        /// #7 Looking for in gallery list
        /// </summary>
        [Test]
        public void FindGallery()
        {
            List<GalleryStructure> list = null;

            var requestMessage =
                HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, $"{_host}{"/api/Gallery/List"}",
                    _token);


            using (var client = new HttpClient())
            {
                var responseMessage = client.SendAsync(requestMessage).Result;
                list = responseMessage.IsSuccessStatusCode
                    ? JsonConvert.DeserializeObject<List<GalleryStructure>>(responseMessage.Content.ReadAsStringAsync()
                        .Result)
                    : null;
            }
            Assert.IsTrue(list.Any(x => x.Name == _newName));
        }

        /// <summary>
        /// #8 Upload photo
        /// </summary>
        [Test]
        public void PutPhoto()
        {
            PictureBindingModel model = new PictureBindingModel
            {
                DateTime = DateTime.Now,
                Name = "photo.png",
                GalleryName = _newName,
                Geolocation = "Lviv"
            };
            Assert.IsTrue(OperateData(model, _picture, new HttpClient(), HttpMethod.Put));
        }

        /// <summary>
        /// #9 Delete photo
        /// </summary>
        [Test]
        public void DeletePhoto()
        {
            PictureBindingModel model = new PictureBindingModel
            {
                Name = "photo.png",
                GalleryName = _newName
            };
            Assert.IsTrue(OperateData(model, _picture, new HttpClient(), HttpMethod.Delete));
        }

        /// <summary>
        /// #10 Delete Gallery
        /// </summary>
        [Test]
        public void DeleteGallery()
        {
            GalleryBindindModel model = new GalleryBindindModel {Name = _oldName};
            Assert.IsTrue(OperateData(model, _gallery, new HttpClient(), HttpMethod.Delete));
        }



        #region Helpers

        /// <summary>
        /// Operating data with some methods: PATH,DELETE,PUT
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="model">any model</param>
        /// <param name="url"></param>
        /// <param name="client"></param>
        /// <param name="method">Http Method</param>
        /// <returns></returns>
        public bool OperateData<T>(T model, string url, HttpClient client,HttpMethod method)
        {
                var requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(method, $"{_host}{url}", _token);
                requestMessage.Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8,
                    MimeJson);
                var responseMessage = client.SendAsync(requestMessage).Result;
                return responseMessage.IsSuccessStatusCode;
        }
        #endregion
    }
}

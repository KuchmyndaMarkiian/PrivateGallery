using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using PrivateGallery.Common.BindingModels;
using PrivateGallery.Tests;

namespace PrivateGallery.Tests
{
    [TestClass]
    //TODO: need refactoring
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
                "h4TcWNLiymfhbX8SDN_aXCnescwpBdmaSoNwiQpp287-65snKlCZH1WWZIH8NECncZ1uQrarVZqbjfQ95qyukBFhTGhS5bFngiJXPjABCh1qrKlf0vUd5GomQcWTh9sHeP5w8t5uxKjVRt4y2eaFqGzMMuz57izFxMmYlx6aVi4FWp2xY6Q21IyHGgTibV5IJHyRmuP5_DQbpjIW0K95_y0cna5sYWiQ8lSLFbyAxawutPfSHiUlL7Q9IkwJT8NJ-6Qp9bbrp8a-hDtnvDx-CdxCC8YSWHyH7bbhUXHPpr2SRNmR_toVnsFABVa4wUiXMBu2Bamn0Nw6plUtyN9EHpBoUsXeaegsuYfaGC2iZvhiXzBlKcJevtOABWNsuciaRhg7F5Cwg1Gwnkt2pc5i21nxzBzvJdOi8FK5L1fvlaV0poUo5ymJUfv_OkaEimhE66Q0T-aYnIZoWfqEb0Mc5k4CWpHcxDGat2o1o3LetG9erdjLAKE_Pq9FiXq2MDeI";

        /// <summary>
        /// #1 Get concrete user`s authorization token 
        /// </summary>
        [TestMethod]
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
        [TestMethod]
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
        [TestMethod]
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
        [TestMethod]
        public void CreateGallery()
        {
            GalleryBindindModel model = new GalleryBindindModel {DateTime = DateTime.Now, Name = _oldName};
            Assert.IsTrue(OperateData( model,_gallery,new HttpClient(),HttpMethod.Put ));
        }
        /// <summary>
        /// #5 Renaming Gallery
        /// </summary>
        [TestMethod]
        public void RenameGallery()
        {
            GalleryBindindModel model = new GalleryBindindModel { DateTime = DateTime.Now, Name = _oldName,NewName = _newName};
            Assert.IsTrue(OperateData(model, _gallery, new HttpClient(), new HttpMethod("PATCH")));
        }
        /// <summary>
        /// #6 Get a renamed gallery
        /// </summary>
        [TestMethod]
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
        [TestMethod]
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
        [TestMethod]
        public void PutPhoto()
        {
            PictureBindingModel model = new PictureBindingModel
            {
                DateTime = DateTime.Now,
                Name = "photo.png",
                GalleryId = _newName,
                Geolocation = "Lviv"
            };
            Assert.IsTrue(OperateData(model, _picture, new HttpClient(), HttpMethod.Put));
        }

        /// <summary>
        /// #9 Delete photo
        /// </summary>
        [TestMethod]
        public void DeletePhoto()
        {
            PictureBindingModel model = new PictureBindingModel
            {
                Name = "photo.png",
                GalleryId = _newName
            };
            Assert.IsTrue(OperateData(model, _picture, new HttpClient(), HttpMethod.Delete));
        }

        /// <summary>
        /// #10 Delete Gallery
        /// </summary>
        [TestMethod]
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

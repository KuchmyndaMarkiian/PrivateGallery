using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using SafeCloud.Common.BindingModels;
using SafeCloud.Tests;

namespace SafeCloud.Tests
{
    [TestClass]
    public partial class UnitTests
    {
        private readonly string _email = "harrisonford@gmail.com";
        private readonly string _password = "Mark95!";
        //private readonly string _host = "http://192.168.0.102:57643";
        private readonly string _host = "http://safecloud.azurewebsites.net";
        private readonly string _gallery = "/api/Folder";
        private readonly string _picture = "/api/File";
        private readonly string _oldName = "Little Cars";
        private readonly string _newName = "Hype-Cars";
        private string MimeJson => "application/json";
        string FolderId;
        string FileId;

        private  string _token ;

        private string gallerypath= "gallery.txt";
        private string photopath = "photo.txt";
        private string tokenpath = "token.txt";
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
            UserToken res = null;
            Send();

            Assert.IsTrue(!string.IsNullOrEmpty(res.AccessToken));


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
                        File.WriteAllText(tokenpath,res.AccessToken);
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
            _token = File.ReadAllText(tokenpath);
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
            _token = File.ReadAllText(tokenpath);
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
            _token = File.ReadAllText(tokenpath);
            FolderBindindModel model = new FolderBindindModel {DateTime = DateTime.Now, Name = _oldName};
            Tuple<bool, string> body = OperateData(model, _gallery, new HttpClient(), HttpMethod.Put);
            File.WriteAllText(gallerypath,body.Item2);
            Assert.IsTrue(body.Item1);
        }

        /// <summary>
        /// #5 Renaming Gallery
        /// </summary>
        [TestMethod]
        public void RenameGallery()
        {
            _token = File.ReadAllText(tokenpath);
            FolderId = File.ReadAllText(gallerypath);
            FolderBindindModel model = new FolderBindindModel {Id = FolderId, NewName = _newName};
            Tuple<bool, string> body = OperateData(model, _gallery, new HttpClient(), new HttpMethod("PATCH"));
            Assert.IsTrue(body.Item1);
        }

        /// <summary>
        /// #6 Get a renamed gallery
        /// </summary>
        [TestMethod]
        public void GetConcreteGallery()
        {
            _token = File.ReadAllText(tokenpath);
            FolderBindindModel model = new FolderBindindModel();
            Send();

            Assert.IsTrue(model.Name == _newName);

            void Send()
            {
                FolderId = File.ReadAllText(gallerypath);
                var param = $"/api/Folder?id={FolderId}";
                HttpRequestMessage requestMessage =
                    HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get,
                        $"{_host}{param}", _token);
                using (var client = new HttpClient())
                {
                    var response = client.SendAsync(requestMessage).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        model =
                            JsonConvert.DeserializeObject<FolderBindindModel>(response.Content.ReadAsStringAsync()
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
            _token = File.ReadAllText(tokenpath);
            List<GalleryStructure> list = null;

            var requestMessage =
                HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Get, $"{_host}{"/api/Folder/List"}",
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
            _token = File.ReadAllText(tokenpath);
            FolderId = File.ReadAllText(gallerypath);
            FileBindingModel model = new FileBindingModel
            {
                DateTime = DateTime.Now,
                Name = "photo.png",
                ParentId = FolderId,
                Geolocation = "Lviv"
            };
            Tuple<bool, string> body = OperateData(model, _picture, new HttpClient(), HttpMethod.Put);
            File.WriteAllText(photopath,body.Item2);
            Assert.IsTrue(body.Item1);
        }

        /// <summary>
        /// #9 Delete photo
        /// </summary>
        [TestMethod]
        public void DeletePhoto()
        {
            _token = File.ReadAllText(tokenpath);
            FileId = File.ReadAllText(photopath);
            FileBindingModel model = new FileBindingModel
            {
                Id = FileId
            };
            Tuple<bool, string> body = OperateData(model, _picture, new HttpClient(), HttpMethod.Delete);
            Assert.IsTrue(body.Item1);
        }

        /// <summary>
        /// #10 Delete Gallery
        /// </summary>
        [TestMethod]
        public void DeleteGallery()
        {
            _token = File.ReadAllText(tokenpath);
            FolderId = File.ReadAllText(gallerypath);
            FolderBindindModel model = new FolderBindindModel {Id = FolderId};
            Tuple<bool, string> body = OperateData(model, _gallery, new HttpClient(), HttpMethod.Delete);
            Assert.IsTrue(body.Item1);
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
        public Tuple<bool, string> OperateData<T>(T model, string url, HttpClient client, HttpMethod method)
        {
            var requestMessage =
                HttpRequestMessageCreator.CreateHeaderRequestMessage(method, $"{_host}{url}", _token);
            requestMessage.Content = new StringContent(JsonConvert.SerializeObject(model), Encoding.UTF8,
                MimeJson);
            var responseMessage = client.SendAsync(requestMessage).Result;
            return new Tuple<bool, string>(responseMessage.IsSuccessStatusCode,
                responseMessage.Content.ReadAsStringAsync().Result.Replace("\"", ""));
        }

        #endregion
    }
}
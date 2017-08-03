using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using PrivateGallery.Android.Models;
using PrivateGallery.Android.Models.Errors;

namespace PrivateGallery.Android.Infrastructure
{
    class AutorizationService:IDisposable
    {
        
        #region  Fields

        private String _message = "";
        private HttpResponseMessage _responseMessage = null;

        #endregion

        #region MainMethods

        public void Register(ref UserAccount account)
        {
            _message = "";
            var model = new
            {
                FirstName =account.FirstName,
                LastName = account.FirstName,
                Email = account.Email,
                Password = account.Password,
                ConfirmPassword = account.Password
            };
            using (var client = new HttpClient())
            {
                try
                {
                    var json = JsonConvert.SerializeObject(model);
                    var content = new StringContent(json, Encoding.UTF8, Settings.Instance.MimeJson);
                    _responseMessage = client.PostAsync(
                            Settings.ServerAdress + Settings.RegisterAdress,
                            content)
                        .Result;
                    if (_responseMessage.IsSuccessStatusCode)
                    {
                        return;
                    }
                    var messages = _responseMessage.Content.ReadAsStringAsync().Result;
                    ConcatMessages(JsonConvert.DeserializeObject<RegisterError>(messages)
                        .ModelState.Messages.ToArray());
                }
                catch (Exception e)
                {
                    _message = e.Message;
                }
            }
        }

        public void SignIn(ref UserAccount account)
        {
            _message = "";
            var token = GetToken(account);
            if (!string.IsNullOrEmpty(token?.AccessToken))
            {
                account.UserToken = token;
            }
        }

        public void LogOut(ref UserAccount account)
        {
            using (var client = new HttpClient())
            {
                try
                {
                    _responseMessage = client.SendAsync(HttpRequestMessageCreator.CreateHeaderRequestMessage(HttpMethod.Post,
                            Settings.LogoutAdress, account.UserToken.AccessToken))
                        .Result;
                    if (!_responseMessage.IsSuccessStatusCode)
                        _message = _responseMessage.Content.ReadAsStringAsync().Result;
                }
                catch (Exception exception)
                {
                    _message = exception.Message;
                }
                finally
                {
                    //Todo need destroy session & datas
                }
            }
        }

        #endregion

        #region State & messages

        public bool IsSuccessful() => _responseMessage.IsSuccessStatusCode;

        public string GetMessage() => _message;

        private void ConcatMessages(string message)
        {
            _message += $"{message}\n";
        }

        private void ConcatMessages(string[] messages)
        {
            foreach (var message in messages)
            {
                ConcatMessages(message);
            }
        }

        #endregion

        #region Token Converting

        private UserToken GetToken(UserAccount user)
        {
            var pairs = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("grant_type", "password"),
                new KeyValuePair<string, string>("username", user.Email),
                new KeyValuePair<string, string>("Password", user.Password)
            };
            var content = new FormUrlEncodedContent(pairs);

            using (var client = new HttpClient())
            {
                try
                {
                    _responseMessage =
                        client.PostAsync(Settings.ServerAdress + Settings.LoginAdress,
                                content)
                            .Result;
                    String result = _responseMessage.Content.ReadAsStringAsync().Result;
                    if (_responseMessage.IsSuccessStatusCode)
                    {
                        return JsonConvert.DeserializeObject<UserToken>(result);
                    }
                    string key = "error_description";
                    var messageDictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(result);
                    if (messageDictionary.ContainsKey(key))
                    {
                        _message = messageDictionary[key];
                    }
                    else
                    {
                        _message = "Server error";
                    }
                }
                catch (Exception e)
                {
                    _message = e.Message;
                }
                return null;
            }
        }

        #endregion

        public void Dispose()
        {
            _responseMessage?.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.Graphics;
using Android.Graphics.Drawables;
using Android.Locations;
using Android.OS;
using Android.Provider;
using Android.Widget;
using Newtonsoft.Json;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Models;
using PrivateGallery.Common.BindingModels;
using File = Java.IO.File;
using Settings = PrivateGallery.Android.Infrastructure.Settings;
using Uri = Android.Net.Uri;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/Theme.Custom")]
    public class PhotoEditScreen : Activity, ILocationListener
    {
        #region Variables

        private AlertDialog.Builder _dialog;
        private PictureBindingModel _model = new PictureBindingModel();
        private GalleryStructure _galleryStructure;
        private MemoryStream _stream = new MemoryStream();
        string _path;
        private Location _currentLocation;
        private LocationManager _locationManager;
        private string _locationProvider;

        #endregion

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.PhotoEditScreen);
            // Create your application here
            _galleryStructure = JsonConvert.DeserializeObject<GalleryStructure>(Intent.GetStringExtra("gallery"));
            _model.GalleryName = _galleryStructure.Name;

            #region UIElement's events

            FindViewById<EditText>(Resource.Id.pictureDescription).AfterTextChanged +=
                (sender, args) => _model.Description = (sender as EditText).Text;
            FindViewById<Button>(Resource.Id.uploadPictureFull).Click += UploadPhoto;
            FindViewById<Button>(Resource.Id.setGeoButton).Click += SetGeo;

            #endregion

            #region PickerDialog

            _dialog = new AlertDialog.Builder(this);
            _dialog.SetPositiveButton("Camera", (sender, args) =>
                {
                    Intent intent = new Intent(MediaStore.ActionImageCapture);
                    App.File = new File(App.Dir, $"file_{DateTime.Now.ToLongTimeString()}.jpg");
                    intent.PutExtra(MediaStore.ExtraOutput, Uri.FromFile(App.File));
                    StartActivityForResult(intent, (int) PickFileTypes.Camera);
                })
                .SetNeutralButton("Gallery", (sender, args) =>
                {
                    Intent = new Intent();
                    Intent.SetType("image/*");
                    Intent.SetAction(Intent.ActionGetContent);
                    StartActivityForResult(Intent.CreateChooser(Intent, "Select Picture"), (int) PickFileTypes.Device);
                })
                .SetNegativeButton("Cancel", (sender, args) => ((AlertDialog) sender).Cancel());

            #endregion

            #region ImagePicker

            var imagePicker = new ImagePicker(this);
            if (imagePicker.CanPickPhoto())
            {
                imagePicker.CreateStorage();
                FindViewById<Button>(Resource.Id.pickPicture).Click += (sender, args) =>
                {
                    _dialog.Show();
                };
            }

            #endregion

            InitializeLocationService();
        }

        /// <summary>
        /// Setting Geolocation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private async void SetGeo(object sender, EventArgs e)
        {
            if (_currentLocation == null)
            {
                Toast.MakeText(this, "Error with searching geolocation", ToastLength.Short).Show();
            }
            else
            {
                Address address = await ReverseGeocodeCurrentLocation();
                DisplayAddress(address);
            }
        }

        private void InitializeLocationService()
        {
            _locationManager = GetSystemService(LocationService) as LocationManager;
            Criteria criteria = new Criteria() {Accuracy = Accuracy.Fine};
            var providers = _locationManager.GetProviders(criteria, true);
            _locationProvider = providers.Any() ? providers.First() : string.Empty;
        }

        protected override void OnResume()
        {
            base.OnResume();
            _locationManager.RequestLocationUpdates(_locationProvider, 0, 0, this);
        }

        protected override void OnPause()
        {
            base.OnPause();
            _locationManager.RemoveUpdates(this);
        }

        /// <summary>
        /// Upload photo to server
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UploadPhoto(object sender, EventArgs e)
        {
            if (_model.Content == null || string.IsNullOrEmpty(_path)) return;
            var dialog = new Dialog(this);
            dialog.InitializeLoadingDialog();
            dialog.Show();
            var instance = UserAccount.Instance;
            var date = DateTime.Now;
            string name =
                $"{instance.FirstName + instance.LastName}{Math.Round(date.TimeOfDay.TotalMilliseconds)}.{_path.Split('.').Last()}";
            Task.Run(async () =>
            {
                using (var cloud =
                    new PrivateGalleryCloudSystem(
                        new HttpManager(Settings.ServerAdress)
                        {
                            AccessToken = UserAccount.Instance.UserToken.AccessToken
                        }))
                {
                    if (await cloud.CreatePicture(name, _model.GalleryName, date, _model.Description,
                        _model.Geolocation))
                    {
                        int i = 0;
                        while (i++ < 3)
                        {
                            if (!cloud.UploadPicture(new HttpManager.StreamPack
                            {
                                Name = _model.GalleryName,
                                FullName = name,
                                Stream = _stream.ToArray()
                            }))
                            {
                                RunOnUiThread(() => Toast.MakeText(this, "Server Error", ToastLength.Short).Show());
                            }
                        }
                    }
                    else
                    {
                        RunOnUiThread(() => Toast.MakeText(this, "Server Error", ToastLength.Short).Show());
                    }
                    RunOnUiThread(() =>
                    {
                        dialog.Dismiss();
                        var intent = new Intent(this, typeof(GalleryScreen));
                        intent.PutExtra("gallery", JsonConvert.SerializeObject(_galleryStructure));
                        StartActivity(intent);
                        Finish();
                    });
                }
            });
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            Uri uri;
            _model.Content = new MemoryStream();
            var imageView = FindViewById<ImageView>(Resource.Id.pickedPhoto);
            switch (requestCode)
            {
                case (int) PickFileTypes.Camera:
                {
                    var mediaScanIntent = new Intent(Intent.ActionMediaScannerScanFile);
                    uri = Uri.FromFile(App.File);
                    _path = App.File.Path;
                    mediaScanIntent.SetData(uri);
                    SendBroadcast(mediaScanIntent);
                    if (App.Bitmap != null)
                    {
                        var bit = BitmapFactory.DecodeFile(_path);
                        imageView.SetImageBitmap(bit);
                    }
                    break;
                }
                case (int) PickFileTypes.Device:
                {
                    if (resultCode == Result.Ok && data != null)
                    {
                        uri = data.Data;
                        _path = FileHelper.GetRealPathFromUri(uri, this);
                        var bit = BitmapFactory.DecodeFile(_path);
                        imageView.SetImageBitmap(bit);
                    }
                    break;
                }
            }
            var format = _path.Split('.').Last();
            var compressType = Bitmap.CompressFormat.Webp;
            if (format.ToLowerInvariant() == "jpg" || format.ToLowerInvariant() == "jpeg")
                compressType = Bitmap.CompressFormat.Jpeg;
            else if (format.ToLowerInvariant() == "png")
            {
                compressType = Bitmap.CompressFormat.Png;
            }
            Drawable d = imageView.Drawable;
            Bitmap bitmap = ((BitmapDrawable) d).Bitmap;
            bitmap.Compress(compressType, 100, _stream);
        }

        #region Location Service

        public void OnLocationChanged(Location location)
        {
            _currentLocation = location;
            SetGeo(null, new EventArgs());
        }

        private async Task<Address> ReverseGeocodeCurrentLocation()
        {
            Geocoder geocoder = new Geocoder(this);
            IList<Address> addressList =
                await geocoder.GetFromLocationAsync(_currentLocation.Latitude, _currentLocation.Longitude, 10);

            Address address = addressList.FirstOrDefault();
            return address;
        }

        private void DisplayAddress(Address address)
        {
            if (address != null)
            {
                StringBuilder deviceAddress = new StringBuilder();
                for (int i = 0; i < address.MaxAddressLineIndex; i++)
                {
                    deviceAddress.AppendLine(address.GetAddressLine(i));
                }
                // Remove the last comma from the end of the address.
                _model.Geolocation = deviceAddress.ToString().TrimEnd(',');
                Toast.MakeText(this, "Coordinates are found", ToastLength.Short).Show();
            }
            else
            {
                Toast.MakeText(this, "Unable to determine the address. Try again in a few minutes.", ToastLength.Short)
                    .Show();
            }
        }

        public void OnProviderDisabled(string provider)
        {
        }

        public void OnProviderEnabled(string provider)
        {
        }

        public void OnStatusChanged(string provider, Availability status, Bundle extras)
        {
        }

        #endregion
    }
}

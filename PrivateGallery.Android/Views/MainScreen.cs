using System;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Views;
using Android.Widget;
using com.refractored.fab;
using Newtonsoft.Json;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Android.Views.Fragments;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Views
{
    [Activity(Label = "Anonymous Gallery", Theme = "@style/Theme.Custom")]
    public class MainScreen : Activity
    {
        #region Fields & Properties

        private ManageGalleryFragment _manageGalleryFragment;
        private ListView _listView;
        private GalleryAdapter _galleryAdapter;
        private Operation _operation;
        private GalleryBindindModel _model;

        #endregion

        private enum Operation
        {
            Create,
            Delete,
            Update
        }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.MainScreen);
            _listView = FindViewById<ListView>(Resource.Id.GalleryList);
            var fab = FindViewById<FloatingActionButton>(Resource.Id.FabButtonGallery);
            _listView.ItemClick += _listView_ItemClick;
            fab.AttachToListView(_listView);
            fab.Click += CreateGallery;
            RegisterForContextMenu(_listView);
            _manageGalleryFragment = new ManageGalleryFragment(ApplyGalleryEvent);
        }

        #region Gallery operations

        private void CreateGallery(object sender, System.EventArgs e)
        {
            _operation = Operation.Create;
            _manageGalleryFragment = new ManageGalleryFragment(ApplyGalleryEvent);
            ShowFragment();
        }

        private async void ApplyGalleryEvent(string name)
        {
            bool result;

            async Task<bool> Operation(PrivateGalleryCloudSystem cloud, Operation operation)
            {
                result = false;
                switch (operation)
                {
                    case MainScreen.Operation.Create:
                        result = await cloud.CreateGallery(name, DateTime.Now);
                        break;
                    case MainScreen.Operation.Update:
                        result = await cloud.UpdateGallery(_model.Name, name);
                        break;
                    case MainScreen.Operation.Delete:
                        result = await cloud.DeleteGallery(name);
                        break;
                }
                return result;
            }

            var http = new HttpManager(Settings.ServerAdress)
            {
                AccessToken = UserAccount.Instance.UserToken.AccessToken
            };
            using (var cloud = new PrivateGalleryCloudSystem(http))
            {
                result = await Operation(cloud, _operation);
            }
            if (!result)
            {
                RunOnUiThread(() => Toast.MakeText(this, "Server Error", ToastLength.Short).Show());
            }
            else
            {
                RunOnUiThread(() =>
                {
                    Toast.MakeText(this, "Gallery applied", ToastLength.Short).Show();
                    OnResume();
                });
            }
        }

        #endregion

        private void ShowFragment()
        {
            _manageGalleryFragment.Show(FragmentManager, nameof(ManageGalleryFragment));
        }

        protected override void OnResume()
        {
            base.OnResume();
            var loadingDialog = new Dialog(this);
            loadingDialog.InitializeLoadingDialog();
            loadingDialog.Show();
            Task.Run(async () =>
            {
                var cloudSystem =
                    new PrivateGalleryCloudSystem(
                        new HttpManager(Settings.ServerAdress)
                        {
                            AccessToken = UserAccount.Instance.UserToken.AccessToken
                        });
                var list = await cloudSystem.DownloadGalleries();
                list?.ForEach(structure =>
                {
                    var name = structure.Name;
                    foreach (var pictureBindingModel in structure.Pictures)
                    {
                        pictureBindingModel.GalleryName = name;
                    }
                });
                RunOnUiThread(() =>
                {
                    _galleryAdapter = new GalleryAdapter(list, this);
                    _listView.Adapter = _galleryAdapter;
                    loadingDialog.Dismiss();
                });
            });
        }

        private void _listView_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            var @object = _galleryAdapter[e.Position];
            Intent intent = new Intent(this, typeof(GalleryScreen));
            intent.PutExtra("gallery", JsonConvert.SerializeObject(@object));
            StartActivity(intent);
        }

        public override void OnCreateContextMenu(IContextMenu menu, View v, IContextMenuContextMenuInfo menuInfo)
        {
            base.OnCreateContextMenu(menu, v, menuInfo);
            if (v.Id == Resource.Id.GalleryList)
            {
                AdapterView.AdapterContextMenuInfo contextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
                _model = _galleryAdapter[contextMenuInfo.Position];
                MenuInflater menuInflater = MenuInflater;
                menuInflater.Inflate(Resource.Menu.galleryMenu, menu);
                menu.SetHeaderTitle(_model.Name);
            }
        }
        public override bool OnContextItemSelected(IMenuItem item)
        {
            AdapterView.AdapterContextMenuInfo contextMenuInfo = (AdapterView.AdapterContextMenuInfo) item.MenuInfo;
            _model = _galleryAdapter[contextMenuInfo.Position];
            switch (item.ItemId)
            {
                case Resource.Id.editGallery:
                    _operation = Operation.Update;
                    ShowFragment();
                    return true;
                case Resource.Id.deleteGallery:
                    _operation = Operation.Delete;
                    ApplyGalleryEvent(_model.Name);
                    return true;
                default: return base.OnContextItemSelected(item);
            }
        }
    }
}
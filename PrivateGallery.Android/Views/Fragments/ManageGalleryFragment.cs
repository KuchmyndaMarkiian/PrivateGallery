using System;
using System.Threading.Tasks;
using Android.App;
using Android.OS;
using Android.Views;
using Android.Widget;
using PrivateGallery.Android.Helpers;

namespace PrivateGallery.Android.Views.Fragments
{
    [Activity(Theme = "@style/Theme_Custom")]
    public sealed class ManageGalleryFragment : DialogFragment
    {
        private readonly  Action<string> _action;

        public string Header { get; set; }

        public ManageGalleryFragment(Action<string> action)
        {
            _action = action;
        }

        private void CreateEvent(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Header))
            {
                Toast.MakeText(Activity, "Empty field", ToastLength.Short).Show();
                return;
            }
            var dialog = new Dialog(Activity);
            dialog.InitializeLoadingDialog();
            dialog.Show();
            Task.Run(() =>
            {
                _action(Header);
                Activity.RunOnUiThread(() =>
                {
                    dialog.Dismiss();
                    Dismiss();
                });
            });

        }

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            // Use this to return your custom view for this Fragment
            var view = inflater.Inflate(Resource.Layout.CreateGalleryFragment, container, false);
            Dialog.SetTitle("Create gallery");
            view.FindViewById<Button>(Resource.Id.applyGalleryButton).Click += CreateEvent;
            view.FindViewById<EditText>(Resource.Id.newGalleryHeader).AfterTextChanged +=
                (sender, args) => Header = ((EditText) sender).Text;
            return view;
        }
    }
}
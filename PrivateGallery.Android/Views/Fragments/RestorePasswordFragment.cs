using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Util;
using Android.Views;
using Android.Widget;
using PrivateGallery.Android.Helpers;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Views.Fragments
{
    [Activity(Theme = "@style/Theme_Custom")]
    public sealed class RestorePasswordFragment : DialogFragment
    {
        private readonly RestorePasswordBindingModel _model;

        public delegate void DialogDelegate(Dialog dialog,DialogFragment dialogFragment);

        private DialogDelegate _dialogDelegate;
        private Activity _parent;
        public RestorePasswordFragment(RestorePasswordBindingModel model, DialogDelegate action, Activity parent)
        {
            _model = model;
            _dialogDelegate = action;
            _parent = parent;
        }


        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            // Use this to return your custom view for this Fragment
            var view = inflater.Inflate(Resource.Layout.RestorePasswordFragment, container, false);
            Dialog.SetTitle("Restore password");
            view.FindViewById<Button>(Resource.Id.restorePassword).Click += (sender, args) =>
            {
                var dialog=new Dialog(_parent);
                dialog.InitializeLoadingDialog();
                dialog.Show();
                //Todo: need fix unhandled exeption
                _dialogDelegate(dialog,this);
            };
            view.FindViewById<EditText>(Resource.Id.newPassword).AfterTextChanged +=
                (sender, args) => _model.NewPassword = ((EditText) sender).Text;
            view.FindViewById<EditText>(Resource.Id.confirmPassword).AfterTextChanged +=
                (sender, args) => _model.ConfirmPassword = ((EditText) sender).Text;
            return view;
        }
    }
}
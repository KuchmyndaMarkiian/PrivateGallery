using System;
using System.Collections.Generic;
using System.Linq;
using Android.App;
using Android.Views;
using Android.Widget;
using PrivateGallery.Android.CustomControls;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Helpers
{
    /// <summary>
    /// Adapter for generating gallery with pictures
    /// </summary>
    internal class PictureAdapter : BaseAdapter<PictureBindingModel>
    {
        private readonly List<PictureBindingModel> _list = new List<PictureBindingModel>();
        private readonly Activity _activity;

        public PictureAdapter(IEnumerable<PictureBindingModel> list, Activity activity)
        {
            _list.AddRange(list);
            _activity = activity;
        }

        public override long GetItemId(int position) => position;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            try
            {
                CustomPictureItem layout = null;
                if (convertView == null)
                {
                    layout = new CustomPictureItem(_activity, this[position]);
                    layout.Initialize();
                }
                else
                {
                    layout = (CustomPictureItem) convertView;
                }
                return layout;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return null;
        }

        public override int Count => _list.Count;

        public override PictureBindingModel this[int position] => _list.ElementAt(position);
    }
}
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
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using PrivateGallery.Android.Infrastructure;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Helpers
{
    class PictureAdapter:BaseAdapter<PictureBindingModel>
    {
        private List<PictureBindingModel> _list=new List<PictureBindingModel>();
        private Activity _activity;
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
                if (convertView == null)
                {
                    var imageView = new ImageView(_activity);
                    var param = ViewGroup.LayoutParams.MatchParent;
                    imageView.LayoutParameters = new ViewGroup.LayoutParams(param, param);
                    imageView.SetScaleType(ImageView.ScaleType.CenterCrop);
                    var item = _list.ElementAt(position);
                    //todo It doesn't work
                    imageView.SetImageDrawable(Drawable.CreateFromStream(item.Content,item.Name));
                    return imageView;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return null;
        }
        public override int Count => _list.Count;

        public override PictureBindingModel this[int position]=> _list.ElementAt(position);
    }
}
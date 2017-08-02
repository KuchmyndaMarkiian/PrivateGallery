using System.Collections.Generic;
using System.Linq;
using Android.App;
using Android.Views;
using Android.Widget;
using Java.Lang;
using PrivateGallery.Android.CustomControls;
using PrivateGallery.Common.BindingModels;

namespace PrivateGallery.Android.Helpers
{
    class GalleryAdapter : BaseAdapter<GalleryStructure>
    {
        private List<GalleryStructure> _list=new List<GalleryStructure>();
        private readonly Activity _activity;

        public GalleryAdapter(List<GalleryStructure> list, Activity activity)
        {
            _list.AddRange(list);
            _activity = activity;
        }

        

        public override GalleryStructure this[int position] => _list.ElementAt(position);

        public override long GetItemId(int position) => position;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            if (convertView == null)
            {
                var item = _list.ElementAtOrDefault(position);
                CustomListItemGallery itemGallery = new CustomListItemGallery(_activity)
                {
                    Header = item.Name,
                    Date = item.DateTime.ToShortDateString(),
                    Count = item.Pictures.Count()
                };
                itemGallery.Initialize();
                return itemGallery;
            }
            return null;
        }

        public override int Count => _list.Count;
    }
}
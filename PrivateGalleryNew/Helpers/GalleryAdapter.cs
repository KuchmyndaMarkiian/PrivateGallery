using System.Collections.Generic;
using System.Linq;
using Android.App;
using Android.Views;
using Android.Widget;
using PrivateGalleryNew.CustomControls;
using PrivateGalleryNew.Models;

namespace PrivateGalleryNew.Helpers
{
    class GalleryAdapter : BaseAdapter<GalleryStructure>
    {
        private readonly List<GalleryStructure> _list;
        private readonly Activity _activity;

        public GalleryAdapter(List<GalleryStructure> list, Activity activity)
        {
            _list = list;
            _activity = activity;
        }

        public override GalleryStructure this[int position] => _list.ElementAtOrDefault(position);

        public override long GetItemId(int position) => position;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            //LinearLayout layout = null;
            if (convertView == null)
            {
                var item = _list.ElementAtOrDefault(position);
                CustomListItemGallery itemGallery = new CustomListItemGallery(_activity)
                {
                    Header = item.Name,
                    Date = item.DateTime.ToShortDateString(),
                    Count = item.Pictures.Count()
                };
                return itemGallery;
            }
            return null;
        }

        public override int Count => _list.Count;
    }
}
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
    /// Adapter for generating listview of galleries
    /// </summary>
    internal class GalleryAdapter : BaseAdapter<GalleryStructure>
    {
        private readonly List<GalleryStructure> _list = new List<GalleryStructure>();
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
                CustomListItemGallery itemGallery =
                    new CustomListItemGallery(new ContextThemeWrapper(_activity, Resource.Style.Theme_Custom))
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
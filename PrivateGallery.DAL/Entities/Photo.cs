namespace PrivateGallery.DAL.Entities
{
    public class Photo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
        public string Description { get; set; }
        public virtual Gallery Folder { get; set; }
    }
}

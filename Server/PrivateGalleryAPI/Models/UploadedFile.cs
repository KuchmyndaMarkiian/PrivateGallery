namespace SafeCloud.API.Models
{
    public class UploadedFile
    {
        public string Name { get; set; }

        public string Path { get; set; }
        public long Size { get; set; }

        public UploadedFile(string n, string p, long s)
        {
            Name = n;
            Path = p;
            Size = s;
        }
    }
}
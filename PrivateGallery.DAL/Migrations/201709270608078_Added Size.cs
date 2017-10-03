namespace SafeCloud.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddedSize : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Files", "Size", c => c.Long(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Files", "Size");
        }
    }
}

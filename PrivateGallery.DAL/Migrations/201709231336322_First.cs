namespace SafeCloud.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class First : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Files", "Attribute_Id", "dbo.Attributes");
            DropForeignKey("dbo.Folders", "Attribute_Id", "dbo.Attributes");
            DropIndex("dbo.Files", new[] { "Attribute_Id" });
            DropIndex("dbo.Folders", new[] { "Attribute_Id" });
            AddColumn("dbo.Files", "AttributeHasPublicAccess", c => c.Boolean(nullable: false));
            AddColumn("dbo.Folders", "AttributeHasPublicAccess", c => c.Boolean(nullable: false));
            DropColumn("dbo.Files", "Attribute_Id");
            DropColumn("dbo.Folders", "Attribute_Id");
            DropTable("dbo.Attributes");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Attributes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        HasPublicAccess = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Folders", "Attribute_Id", c => c.Int(nullable: false));
            AddColumn("dbo.Files", "Attribute_Id", c => c.Int(nullable: false));
            DropColumn("dbo.Folders", "AttributeHasPublicAccess");
            DropColumn("dbo.Files", "AttributeHasPublicAccess");
            CreateIndex("dbo.Folders", "Attribute_Id");
            CreateIndex("dbo.Files", "Attribute_Id");
            AddForeignKey("dbo.Folders", "Attribute_Id", "dbo.Attributes", "Id", cascadeDelete: true);
            AddForeignKey("dbo.Files", "Attribute_Id", "dbo.Attributes", "Id", cascadeDelete: true);
        }
    }
}

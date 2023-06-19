using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BananaChefDAL.Migrations
{
    /// <inheritdoc />
    public partial class init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    UserID = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Username = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    Email = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: false),
                    Password = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    IsAdmin = table.Column<bool>(type: "bit", nullable: false),
                    ProfileImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.UserID);
                });

            migrationBuilder.InsertData(
                table: "User",
                columns: new[] { "UserID", "CreatedAt", "Email", "IsAdmin", "Password", "ProfileImageUrl", "UpdatedAt", "Username" },
                values: new object[] { new Guid("3f18cc8b-0d24-40e8-94b2-24557f5452b8"), new DateTime(2023, 6, 19, 17, 38, 12, 571, DateTimeKind.Utc).AddTicks(3356), "bananestar@bananacorp.com", true, "Test1234=", "https://firebasestorage.googleapis.com/v0/b/quizermania-f7be1.appspot.com/o/bv2.jpg?alt=media&token=5c0fc6fc-1cc3-4b30-9c56-05fdc3d15a45", new DateTime(2023, 6, 19, 17, 38, 12, 571, DateTimeKind.Utc).AddTicks(3357), "bananestar" });

            migrationBuilder.CreateIndex(
                name: "IX_User_Email",
                table: "User",
                column: "Email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_User_Username",
                table: "User",
                column: "Username",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "User");
        }
    }
}

```markdown
Web use ASP.NET core, RazorPage, SignalR, PayOS, Login GOOGLE/FACEBOOK<br>
DB: SQL Server


git clone https://github.com/Twna21/TwnaShopCICD.git
git checkout -b NameBranch

link demo: [twna.shop](https://twnashop20.azurewebsites.net/)
ac: tuongnmde170578@fpt.edu.vn
pw: manhtuong1

How to RUN: 

1: dotnet ef database update
2: Set StartUP Project --> ShopWEB

If using .NET 8, change the following:
<PropertyGroup>
  <TargetFramework>net7.0</TargetFramework> <!-- change to 8.0 -->
  <ImplicitUsings>enable</ImplicitUsings>
  <Nullable>enable</Nullable>
</PropertyGroup>

The project have 2 Dbcontext so:
      1: dotnet ef database update --context ShopDbContext
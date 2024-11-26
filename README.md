```markdown
Web use ASP.NET core API, RazorPage, SignalR, PayOS, Login GOOGLE/FACEBOOK<br>
Lazy loading, Ajax, search with autocomplete JS.
Tool: github, visual studio
CiCd: github action with azure.
DB: SQL Server


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

Functions: 
User:
    - Users can log in using Google, Facebook, or an account created on the website.
    - Users can purchase products, make payments online (using the payment method PayOS), and track their orders on the website.
    - Users can review products after completing their purchases.
    - The website is user-friendly, featuring lazy loading for better performance and supporting functionalities such as     
      chat and notifications, can switch 2 languge: VN - EN.

Admin: - Make management products, orders with CRUD
      - View all statistics with charts realtime SignalR


namespace ShopWeb
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            var configuration = builder.Configuration;
            // Add services to the container.

            // Configure Elasticsearch
            // var settings = new ConnectionSettings(new Uri("http://localhost:9200"))
            //     .DefaultIndex("products");
            // var client = new ElasticClient(settings);
            // builder.Services.AddSingleton<IElasticClient>(client);



            builder.Services.AddLocalization(opts => { opts.ResourcesPath = "Resources"; });
            builder.Services.Configure<RequestLocalizationOptions>(options =>
            {
                var supportedCultures = new List<CultureInfo>()
                {
                     new CultureInfo("vi-VN"),
                    new CultureInfo("en-US"),
                };

                options.DefaultRequestCulture = new RequestCulture(supportedCultures.First());
                options.SupportedCultures = supportedCultures;
                options.SupportedUICultures = supportedCultures;
            });

            // Register SharedViewLocalizer
            builder.Services.AddSingleton<SharedViewLocalizer>();



            builder.Services.AddScoped<CaptchaService>();
            builder.Services.AddScoped<TranslateService>();
            builder.Services.AddScoped<StatisticService>();
            builder.Services.AddRazorPages();

            builder.Services.AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = GoogleDefaults.AuthenticationScheme;
            });

            if (builder.Environment.IsProduction())
            {

                builder.Configuration.AddEnvironmentVariables();
            }


            builder.Services.AddAuthentication().AddGoogle(googleOptions =>
            {
                googleOptions.ClientId = configuration["Authentication:Google:ClientId"];
                googleOptions.ClientSecret = configuration["Authentication:Google:ClientSecret"];

                googleOptions.Scope.Add("profile");
                googleOptions.Events.OnCreatingTicket = (context) =>
                {
                    var picture = context.User.GetProperty("picture").GetString();

                    context.Identity.AddClaim(new Claim("picture", picture));

                    return Task.CompletedTask;
                };
            });

            //builder.Services.AddAuthentication().AddFacebook(facebookOptions =>
            //{

            //    facebookOptions.AppId = builder.Configuration["Authentication:Facebook:AppId"];
            //    facebookOptions.AppSecret = builder.Configuration["Authentication:Facebook:AppSecret"];
            //    facebookOptions.Scope.Add("public_profile");
            //    facebookOptions.Fields.Add("picture");
            //    facebookOptions.Events = new OAuthEvents
            //    {
            //        OnCreatingTicket = context =>
            //        {
            //            var identity = (ClaimsIdentity)context.Principal.Identity;
            //            var profileImg = context.User.GetProperty("picture").GetProperty("data").GetProperty("url").ToString();
            //            identity.AddClaim(new Claim("picture", profileImg));
            //            return Task.CompletedTask;
            //        }
            //    };

            //});

            var connectionString = builder.Configuration.GetConnectionString("PROJECT");


            builder.Services.AddSignalR();

            builder.Services.AddSingleton<IAccountRepository, AccountRepository>();
            builder.Services.AddSingleton<IProductRepository, ProductRepository>();
            builder.Services.AddSingleton<IOrderDetailRepository, OrderDetailRepository>();
            builder.Services.AddSingleton<IOrderRepository, OrderRepository>();
            builder.Services.AddSingleton<ICategoryRepository, CategoryRepository>();
            builder.Services.AddSingleton<IOtpService, OtpService>();
            builder.Services.AddSingleton<INotificationRepository, NotificationRepository>();
            //builder.Services.AddSingleton<ICommentRepository, CommentRepository>();

            var mailSettings = builder.Configuration.GetSection("MailSettings");
            builder.Services.Configure<MailSettings>(mailSettings);
            builder.Services.AddTransient<ISendGmailService, SendGmailService>();

            builder.Services.AddDbContext<ShopIdentityDbContext>(options =>
                options.UseSqlServer(connectionString));
            builder.Services.AddDatabaseDeveloperPageExceptionFilter();



            builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
                .AddEntityFrameworkStores<ShopIdentityDbContext>();

            builder.Services.AddHttpContextAccessor();
            builder.Services.AddScoped<CartService>();
            builder.Services.AddSingleton<Constants>();
            builder.Services.AddSingleton<PayOS>(sp =>
            {
                var options = sp.GetRequiredService<Constants>();
                return new PayOS(options.ClientId, options.ApiKey, options.ChecksumKey);
            });

            // Register PayProcess
            builder.Services.AddTransient<PayProcess>();
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("AllowAllOrigins", builder =>
                {
                    builder.AllowAnyOrigin()
                           .AllowAnyMethod()
                           .AllowAnyHeader();
                });
            });

            builder.Services.AddSession((options) =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(30);
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential = true;
            });

            builder.Services.AddDistributedMemoryCache();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }


            // Get the localization options and apply them
            var locOptions = app.Services.GetRequiredService<IOptions<RequestLocalizationOptions>>();
            app.UseRequestLocalization(locOptions.Value);

            app.UseSession();

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseResponseCaching();

            app.UseRouting();
            app.UseRewriter(new RewriteOptions()
               .AddRedirect("www.twna.shop", "twna.shop"));

            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapRazorPages();
            });
            app.MapHub<SignalRServer>("/signalrServer");
            app.MapRazorPages();

            app.Run();
        }
    }
}

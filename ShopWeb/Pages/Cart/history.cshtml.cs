namespace ShopWeb.Pages.Cart
{
    public class historyModel(
       PayOS payProcess,
       TranslateService translateService,
       IHubContext<SignalRServer> signalRHub,
       INotificationRepository noti,
       IStringLocalizer<SuccessModel> localizer
   ) : PageModel
    {
        public IList<CartItem> CartItems { get; set; } = new List<CartItem>();
        private readonly ShopDbContext _context = new ShopDbContext();

        private readonly PayOS _payOS = payProcess;
        private readonly TranslateService _translateService = translateService;
        private readonly IHubContext<SignalRServer> _signalRHub = signalRHub;
        private readonly INotificationRepository _noti = noti;
        private readonly IStringLocalizer<SuccessModel> _localizer = localizer;


        public async Task OnGetAsync()
        {
            ViewData["Cultures"] = await _translateService.GetAvailableCultures();

            var cart = HttpContext.Session.GetString("Cart");
            if (!string.IsNullOrEmpty(cart))
            {
                CartItems = JsonSerializer.Deserialize<List<CartItem>>(cart);
            }

            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? "";

            if (int.TryParse(HttpContext.Request.Cookies["UserId"], out int uid))
            {
                if (_context.OrderDetails != null)
                {
                    OrderDetail = await _context.OrderDetails
                                   .Include(o => o.Order)
                                   .Include(o => o.Product)
                                   .Where(o => o.Order.CustomerId == uid)
                                   .OrderByDescending(o => o.Order.OrderDate)
                                   .ToListAsync();

                }
            }

            ViewData["UserName"] = HeaderModelView.UserName;
        }


        public async Task<IActionResult> OnPostRequestRefundAsync(int orderId)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == orderId);

            if (order != null && order.Status == 1)
            {
                order.Status = 3; // Set status to 3 (Refund Requested)
                await _context.SaveChangesAsync();

                // Create a notification for the refund request
                var notification = new Notification
                {
                    UserID = order.CustomerId ?? 0,
                    Title = _localizer["Refund Requested"],
                    MessageContent = _localizer["Your refund request has been submitted."],
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://static.vecteezy.com/system/resources/previews/015/872/168/original/payment-cancellation-icon-isometric-style-vector.jpg"
                };

                await _noti.Add(notification);

                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity"); // Notify clients if needed
            }

            return RedirectToPage();
        }

        public async Task<IActionResult> OnPostDisputeOrderAsync(int orderId)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == orderId);

            // Allow the user to raise a dispute if the status is currently 'Received' (status = 1)
            if (order != null && order.Status == 1)
            {
                order.Status = 4; // Set status to 'Disputed'
                await _context.SaveChangesAsync();

                // Create a notification for the dispute
                var notification = new Notification
                {
                    UserID = order.CustomerId ?? 0,
                    Title = _localizer["Order Disputed"],
                    MessageContent = _localizer["Your order has been disputed."],
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://cdn4.iconfinder.com/data/icons/server-database/60/server__exclamation__warning__database__datacenter-1024.png"
                };

                await _noti.Add(notification);

                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity"); // Notify clients if needed
            }

            return RedirectToPage();
        }

        public async Task<IActionResult> OnPostCancelOrderAsync(int orderId, byte currentStatus)
        {
            var order = await _context.Orders.FindAsync(orderId);
            if (order != null)
            {
                order.Status = (byte)2; // Set status to 2 (Canceled)
                await _context.SaveChangesAsync();

                string translatedMessage = string.Format(_localizer["The order has been canceled."]);

                int userId = order.CustomerId ?? 0;

                var notification = new Notification
                {
                    UserID = userId,
                    Title = _localizer["Canceled Successful"],
                    MessageContent = translatedMessage,
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://cdn-icons-png.flaticon.com/512/4764/4764977.png"
                };

                await _noti.Add(notification);

                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity"); // Notify clients if needed
            }

            return RedirectToPage();
        }


        public async Task<IActionResult> OnPostSetLanguage(string culture, string returnUrl)
        {
            await _translateService.SetLanguage(culture, Response);

            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;

            if (string.IsNullOrEmpty(returnUrl))
            {
                returnUrl = Url.Page("/Index");
            }

            return LocalRedirect(returnUrl);
        }



        public class HeaderModel
        {
            public string? UserName { get; set; }
            public string? Type { get; set; }
            public string? WelcomeMessage { get; set; }
        }
        public HeaderModel? HeaderModelView = new HeaderModel();
        public IList<OrderDetail> OrderDetail { get; set; } = default!;
    }

}


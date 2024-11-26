namespace ShopWeb.Pages.Payment
{
    public class SuccessModel : PageModel
    {
        private readonly ShopDbContext _context = new ShopDbContext();
        private readonly INotificationRepository _notificationRepository;
        private readonly IStringLocalizer<SuccessModel> _localizer;
        public SuccessModel(IStringLocalizer<SuccessModel> localizer, INotificationRepository notificationRepository)
        {
            _localizer = localizer;
            _notificationRepository = notificationRepository;
        }
        public async Task<IActionResult> OnGet(int orderId, decimal totalAmount)
        {
            try
            {

                HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
                ViewData["UserName"] = HeaderModelView.UserName;
                // Retrieve the order by orderId or other identifier
                var order = _context.Orders.FirstOrDefault(o => o.OrderId == orderId);
                if (order == null)
                {

                    return RedirectToPage("/Error");
                }

                order.Freight = totalAmount;
                _context.Entry(order).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                HttpContext.Session.Remove("Cart");

                string translatedMessage = string.Format(_localizer["Your payment was successful."]);

                int userId = order.CustomerId ?? 0;
             
                var notification = new Notification
                {
                    UserID = userId, 
                    Title = _localizer["Payment Successful"],
                    MessageContent = translatedMessage,
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://cdn3d.iconscout.com/3d/premium/thumb/successfully-done-4416855-3663892.png"
                };

                await _notificationRepository.Add(notification);
                return Page();
            }
            catch (Exception ex)
            {

                return RedirectToPage("/Error");
            }
        }

        public class HeaderModel
        {
            public string? UserName { get; set; }
            public string? Type { get; set; }
            public string? WelcomeMessage { get; set; }
        }

        private readonly HeaderModel? HeaderModelView = new HeaderModel();

    }
}

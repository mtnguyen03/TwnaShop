namespace ShopWeb.Pages.Payment
{
    public class FailedModel : PageModel
    {
        private readonly ShopDbContext _context = new ShopDbContext();
        private readonly INotificationRepository _notificationRepository;
        private readonly IStringLocalizer<SuccessModel> _localizer;

        public FailedModel(IStringLocalizer<SuccessModel> localizer, INotificationRepository notificationRepository)
        {
            _localizer = localizer;
            _notificationRepository = notificationRepository;
        }

        public async Task<IActionResult> OnGet(int orderId)
        {
            try
            {

                HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
                ViewData["UserName"] = HeaderModelView.UserName;
            
                var order = _context.Orders.Include(o => o.OrderDetails)
                                                   .FirstOrDefault(o => o.OrderId == orderId);

            
                if (order == null)
                {
                    return RedirectToPage("/Error");
                }


                string translatedMessage = string.Format(_localizer["Your payment was failed."]);

                int userId = order.CustomerId ?? 0;

                var notification = new Notification
                {
                    UserID = userId,
                    Title = _localizer["Payment failed"],
                    MessageContent = translatedMessage,
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://cdn2.iconfinder.com/data/icons/caution-alert-warning/64/money-caution-exclamation-warning-risk-512.png"
                };

                await _notificationRepository.Add(notification);

                _context.OrderDetails.RemoveRange(order.OrderDetails);

                // Remove the order
                _context.Orders.Remove(order);
               await _context.SaveChangesAsync();


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

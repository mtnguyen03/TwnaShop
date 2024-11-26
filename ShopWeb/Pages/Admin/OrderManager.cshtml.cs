namespace ShopWeb.Pages.Admin
{
    public class OrderManagerModel : PageModel
    {
        private readonly ShopDbContext _context = new ShopDbContext();
        private readonly IOrderRepository _orderRepository;
        private readonly TranslateService _translateService;
        private readonly IHubContext<SignalRServer> _signalRHub;
        private readonly INotificationRepository _noti;
        private readonly IStringLocalizer<SuccessModel> _localizer;
        public OrderManagerModel(IOrderRepository orderRepository,
            TranslateService translateService,
             IHubContext<SignalRServer> signalRHub,
                       INotificationRepository noti,
              IStringLocalizer<SuccessModel> localizer
             )
        {
            _orderRepository = orderRepository;
            _translateService = translateService;
            _signalRHub = signalRHub;
            _noti = noti;
            _localizer = localizer;
        }

        [BindProperty]
        public IList<OrderReportDto> Orders { get; set; }



        public List<OrderReportDto> PendingOrders { get; set; }
        public List<OrderReportDto> ReceivedOrders { get; set; }
        public List<OrderReportDto> CancelledOrders { get; set; }
        public List<OrderReportDto> DisputeRefundOrders { get; set; }

        public async Task OnGetAsync()
        {
            var allOrders = await _context.Orders
                .Join(
                    _context.Accounts,
                    order => order.CustomerId,
                    account => account.AccountID,
                    (order, account) => new OrderReportDto
                    {
                        CustomerId = order.CustomerId,
                        CustomerName = account.FullName,
                        OrderDate = order.OrderDate,
                        OrderId = order.OrderId,
                        ShippedDate = order.ShippedDate,
                        Freight = order.Freight,
                        ShipAddress = order.ShipAddress,
                        Status = order.Status
                    })
                .OrderByDescending(o => o.OrderId)  // Order by OrderId descending
                .ToListAsync();

            // Group orders by status
            PendingOrders = allOrders.Where(o => o.Status == 0).ToList(); // Status 0: Pending
            ReceivedOrders = allOrders.Where(o => o.Status == 1).ToList(); // Status 1: Đã nhận
            CancelledOrders = allOrders.Where(o => o.Status == 2).ToList(); // Status 2: Đã hủy
            DisputeRefundOrders = allOrders.Where(o => o.Status == 4 || o.Status == 5 || o.Status == 6 || o.Status == 3).ToList(); // Status 4, 5, 6

            await _translateService.SetLanguage("vi-VN", Response);
        }


        public async Task<IActionResult> OnPostChangeStatusAsync(int orderId, byte currentStatus)
        {
            var order = await _context.Orders.Include(o => o.OrderDetails).ThenInclude(od => od.Product).OrderByDescending(o => o.OrderId).FirstOrDefaultAsync(o => o.OrderId == orderId);

            if (order != null)
            {
                // Change order status to 'Received' (1)
                if (currentStatus == 0) // Ensure the current status is Pending (0)
                {
                    order.Status = 1; // Mark as 'Received'
                    foreach (var orderDetail in order.OrderDetails)
                    {
                        var product = await _context.Products.FindAsync(orderDetail.ProductId);
                        if (product != null)
                        {
                            product.QuantityPerUnit -= orderDetail.Quantity;

                            if (product.QuantityPerUnit < 0)
                            {
                                product.QuantityPerUnit = 0;
                            }
                        }
                    }

                    await _context.SaveChangesAsync();
                    await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity");

                    var notification = new Notification
                    {
                        UserID = order.CustomerId ?? 0,
                        Title = _localizer["Order Delivered"],
                        MessageContent = _localizer["Your order has been successfully delivered."],
                        NotificationDate = DateTime.Now,
                        IsRead = false,
                        Photo = "https://static.vecteezy.com/system/resources/previews/015/872/168/original/payment-cancellation-icon-isometric-style-vector.jpg"
                    };

                    await _noti.Add(notification);

                }
            }

            return RedirectToPage();
        }

        public async Task<IActionResult> OnGetDeleteOrderAsync(int id)
        {
            var order = await _orderRepository.GetOrderById(id);
            if (order == null)
            {
                return NotFound();
            }

            await _orderRepository.Delete(order);

            return RedirectToPage("./OrderManager");
        }


        public async Task<IActionResult> OnPostApproveRefundAsync(int orderId)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == orderId);
            if (order != null && order.Status == 3)
            {

                order.Status = 5;
                await _context.SaveChangesAsync();
                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity");


                var notification = new Notification
                {
                    UserID = order.CustomerId ?? 0,
                    Title = _localizer["Refund Approved"],
                    MessageContent = _localizer["Your refund has been approved."],
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://static.vecteezy.com/system/resources/previews/015/872/168/original/payment-cancellation-icon-isometric-style-vector.jpg"
                };

                await _noti.Add(notification);
            }

            return RedirectToPage();
        }

        public async Task<IActionResult> OnPostResolveDisputeAsync(int orderId)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == orderId);
            if (order != null && order.Status == 4) // Ensure the order is in 'Disputed' state
            {
                // Perform dispute resolution logic here
                order.Status = 6;
                await _context.SaveChangesAsync();
                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity");
                var notification = new Notification
                {
                    UserID = order.CustomerId ?? 0,
                    Title = _localizer["Dispute Resolved"],
                    MessageContent = _localizer["Your dispute has been resolved."],
                    NotificationDate = DateTime.Now,
                    IsRead = false,
                    Photo = "https://cdn-icons-png.flaticon.com/512/4764/4764977.png"
                };

                await _noti.Add(notification); // Save the notification
            }

            return RedirectToPage();
        }

    }
}

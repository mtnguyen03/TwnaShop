using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BusinessObject;
using Repository; // Ensure this namespace matches your actual project structure
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAcess.Dto;
using Microsoft.EntityFrameworkCore;
using Repository.TranslateService;
using System.Globalization;
using Microsoft.AspNetCore.SignalR;

namespace ShopWeb.Pages.Admin
{
    public class OrderManagerModel : PageModel
    {
        private readonly ShopDbContext _context = new ShopDbContext();
        private readonly IOrderRepository _orderRepository;
        private readonly TranslateService _translateService;
        private readonly IHubContext<SignalRServer> _signalRHub;
        public OrderManagerModel(IOrderRepository orderRepository,
            TranslateService translateService,
             IHubContext<SignalRServer> signalRHub)
        {
            _orderRepository = orderRepository;
            _translateService = translateService;
            _signalRHub = signalRHub;
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
            DisputeRefundOrders = allOrders.Where(o => o.Status == 4 || o.Status == 5 || o.Status == 6 || o.Status ==3).ToList(); // Status 4, 5, 6

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
            }

            return RedirectToPage();
        }

    }
}

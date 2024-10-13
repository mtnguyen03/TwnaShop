using BusinessObject;
using MailKit.Search;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Nest;
using Net.payOS.Types;
using Net.payOS;
using Repository;
using System.Text.Json;
using Repository.PaymentService;
using System.Linq;
using Repository.TranslateService;
using Microsoft.AspNetCore.SignalR;

namespace ShopWeb.Pages.Cart
{
    public class IndexModel : PageModel
    {
        public IList<CartItem> CartItems { get; set; } = new List<CartItem>();
        private readonly ShopDbContext _context = new ShopDbContext();
        private readonly PayOS _payOS;
        private readonly TranslateService _translateService;
        private readonly IHubContext<SignalRServer> _signalRHub;
        public IndexModel(PayOS payProcess,
             TranslateService translateService,
              IHubContext<SignalRServer> signalRHub
            )
        {
            _payOS = payProcess;
            _translateService = translateService;
            _signalRHub = signalRHub;
        }
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


        public IActionResult OnPostRemoveFromCart(int productId)
        {
            var cart =  HttpContext.Session.GetString("Cart");
            if (string.IsNullOrEmpty(cart))
            {
                return RedirectToPage();
            }

            var cartItems = JsonSerializer.Deserialize<List<CartItem>>(cart);
            var itemToRemove = cartItems.Find(ci => ci.ProductId == productId);
            if (itemToRemove != null)
            {
                cartItems.Remove(itemToRemove);
                HttpContext.Session.SetString("Cart", JsonSerializer.Serialize(cartItems));
            }

            return RedirectToPage();

        }

        public async Task<IActionResult> OnPostProceedToPay(string paymentMethod)
        {
            try
            {
                var culturesCurrent =  _translateService.GetCurrentCulture(HttpContext);
                ViewData["Cultures"] = await _translateService.GetAvailableCultures();


                paymentMethod = paymentMethod ?? string.Empty;
                string? userNameSession = HttpContext.Request.Cookies["UserId"];
                var cart = HttpContext.Session.GetString("Cart");


                List<CartItem>? cartItems = null;
                if (!string.IsNullOrEmpty(cart))
                {
                    try
                    {
                        cartItems = JsonSerializer.Deserialize<List<CartItem>>(cart);
                    }
                    catch (JsonException)
                    {
                        return new JsonResult(new { success = false, message = culturesCurrent == 1 ? "Giỏ hàng trống." : "Cart is empty." });
                    }
                }


                    var customer = _context.Accounts.FirstOrDefault(c => c.AccountID == int.Parse(userNameSession));

                    string message = string.Empty;


                    if (string.IsNullOrEmpty(userNameSession))
                    {
                        message = culturesCurrent == 1 ? "Chưa đăng nhập." : "User not logged in.";
                    }
                    else if (string.IsNullOrEmpty(cart))
                    {
                        message = culturesCurrent == 1 ? "Giỏ hàng trống." : "Cart is empty.";
                    }
                    else if (customer == null)
                    {
                        message = culturesCurrent == 1 ? "Không tìm thấy tài khoản người dùng." : "User account not found.";
                    }
                    else if (string.IsNullOrEmpty(customer.Address))
                    {
                        message = culturesCurrent == 1 ? "Thiếu địa chỉ trong hồ sơ." : "Address is missing in Edit Profile.";
                    }
                    else if (string.IsNullOrEmpty(customer.Phone))
                    {
                        message = culturesCurrent == 1 ? "Thiếu số điện thoại trong hồ sơ." : "Phone number is missing in Edit Profile.";
                    }

                    // If there's a validation message, return a failure response
                    if (!string.IsNullOrEmpty(message))
                    {
                        return new JsonResult(new { success = false, message });
                    }

                decimal totalFreight = 0;

                var orderDetails = new List<OrderDetail>();
                    foreach (var cartItem in cartItems)
                    {
                        var product = _context.Products.FirstOrDefault(p => p.ProductId == cartItem.ProductId);
                        if (product != null)
                        {
                            var orderDetail = new OrderDetail
                            {
                                ProductId = product.ProductId,
                                UnitPrice = product.UnitPrice,
                                Quantity = cartItem.Quantity
                            };
                        totalFreight += orderDetail.Quantity * orderDetail.UnitPrice;
                        orderDetails.Add(orderDetail);
                        }
                    }

                var order = new Order
                {
                    CustomerId = customer.AccountID,
                    OrderDate = DateTime.Now,
                    ShippedDate = DateTime.Now,
                    ShipAddress = customer.Address,
                    Status = 0,// Mark as unpaid initially,
                    Freight = totalFreight
                };

                order.OrderDetails = orderDetails;
                    _context.Orders.Add(order);
                    _context.SaveChanges();
                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity");

                int totalAmount = (int)orderDetails.Sum(od => od.Quantity * od.UnitPrice);

                    if (paymentMethod.Equals("online"))
                    {
                        var paymentData = new PaymentData(
                            order.OrderId,
                            totalAmount,
                            culturesCurrent == 1 ? "Mua hàng: Drink No" : "Buy: DrinkNo on twna.shop",
                            cartItems.Select(c => new ItemData(c.ProductName, c.Quantity, (int)c.UnitPrice)).ToList(),
                            $"https://twna.shop/Payment/Failed?orderId={order.OrderId}",
                            $"https://twna.shop/Payment/Success?orderId={order.OrderId}&totalAmount={totalAmount}"
                        );

                        CreatePaymentResult createPayment = await _payOS.createPaymentLink(paymentData);

                        return new JsonResult(new { success = true, paymentUrl = createPayment.checkoutUrl });
                    }
                    else
                    {
                        return new JsonResult(new { success = true, paymentUrl = $"https://twnashop.azurewebsites.net/Payment/Success?orderId={order.OrderId}&totalAmount={totalAmount}" });
                    }
                }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = "Failed to place order.", error = ex.Message });
            }
        }

        public async Task<IActionResult> OnPostRequestRefundAsync(int orderId)
        {
            var order = await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == orderId);

            // Only allow refund if the order is marked as received (status = 1)
            if (order != null && order.Status == 1)
            {
                order.Status = 3; // Set status to 3 (Refund Requested)
                await _context.SaveChangesAsync();

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

                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity"); // Notify clients if needed
            }

            return RedirectToPage();
        }


        public async Task<IActionResult> OnPostCancelOrderAsync(int orderId, byte currentStatus)
        {
            var order = await _context.Orders.FindAsync(orderId);
            if (order != null)
            {
                order.Status = (byte)2;
                await _context.SaveChangesAsync();
                await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity");
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


    public class CartItem
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Image { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice => UnitPrice * Quantity;
    }

}


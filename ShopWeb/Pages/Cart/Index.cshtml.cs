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
using Microsoft.Extensions.Localization;
using ShopWeb.Pages.Payment;
using Repository.CartService;

namespace ShopWeb.Pages.Cart
{
    public class IndexModel : PageModel
    {
        public IList<CartItem> CartItems { get; set; } = new List<CartItem>();
        private readonly ShopDbContext _context = new ShopDbContext();
        private readonly PayOS _payOS;
        private readonly TranslateService _translateService;
        private readonly IHubContext<SignalRServer> _signalRHub;
        private readonly INotificationRepository _noti;
        private readonly IStringLocalizer<SuccessModel> _localizer;
        public IndexModel(PayOS payProcess,
             TranslateService translateService,
              IHubContext<SignalRServer> signalRHub,
              INotificationRepository noti,
              IStringLocalizer<SuccessModel> localizer
            )
        {
            _payOS = payProcess;
            _translateService = translateService;
            _signalRHub = signalRHub;
            _noti = noti;
            _localizer = localizer;
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
            ViewData["UserName"] = HeaderModelView.UserName;
        }


        public IActionResult OnPostRemoveFromCart(int productId)
        {
            var cart = HttpContext.Session.GetString("Cart");
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

        public async Task<IActionResult> OnPostProceedToPay(string paymentMethod
            , string fullName
            , string mobileNumber
            , string inputadd)
        {
            try
            {
                var culturesCurrent = _translateService.GetCurrentCulture(HttpContext);
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
                else if (string.IsNullOrEmpty(inputadd))
                {
                    message = culturesCurrent == 1 ? "Vui lòng chọn địa chỉ giao hàng." : "Please select a shipping address.";
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
                    ShipAddress = fullName + " " + mobileNumber + " " + inputadd,
                    Status = 0,  // Mark as unpaid initially
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
                    return new JsonResult(new { success = true, paymentUrl = $"https://twna.shop/Payment/Success?orderId={order.OrderId}&totalAmount={totalAmount}" });
                }
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = "Failed to place order.", error = ex.Message });
            }
        }


     

    
        public IActionResult OnPostUpdateQuantity(int productId, string action)
        {
            var cart = HttpContext.Session.GetString("Cart");
            if (string.IsNullOrEmpty(cart))
            {
                return RedirectToPage();
            }

            var cartItems = JsonSerializer.Deserialize<List<CartItem>>(cart) ?? new List<CartItem>();
            var item = cartItems.FirstOrDefault(ci => ci.ProductId == productId);

            if (item != null)
            {
                if (action == "increase")
                {
                    item.Quantity++;
                }
                else if (action == "decrease" && item.Quantity > 1)
                {
                    item.Quantity--;
                }

                HttpContext.Session.SetString("Cart", JsonSerializer.Serialize(cartItems));
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


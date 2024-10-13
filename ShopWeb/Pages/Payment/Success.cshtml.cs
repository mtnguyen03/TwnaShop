using BusinessObject;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace ShopWeb.Pages.Payment
{
    public class SuccessModel : PageModel
    {
        private readonly ShopDbContext _context = new ShopDbContext();
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

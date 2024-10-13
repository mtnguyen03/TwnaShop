using BusinessObject;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace ShopWeb.Pages.Payment
{
    public class FailedModel : PageModel
    {
        private readonly ShopDbContext _context = new ShopDbContext();



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

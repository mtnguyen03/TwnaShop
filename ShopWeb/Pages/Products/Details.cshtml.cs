using BusinessObject;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using Repository;
using Repository.CartService;
using Repository.TranslateService;
using System.Text.Json;

namespace ShopWeb.Pages.Products
{
    public class DetailsModel : PageModel
    {
        private readonly IProductRepository _productRepository;
        private readonly TranslateService _translateService;
        private readonly CartService _cartService;
   
        public DetailsModel(IProductRepository productRepository, CartService cartService,
                            TranslateService translateService, IMemoryCache cache
                           )
        {
            _productRepository = productRepository;
            _translateService = translateService;
            _cartService = cartService;
           
        }

        public IList<CartItem> CartItems { get; set; } = new List<CartItem>();


        public async Task OnGetAsync()

        {
            ViewData["Cultures"] =  await _translateService.GetAvailableCultures();
            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;

        }


        public async Task<IActionResult> OnPostAddToCartAsync(int productId, int? cart_quantity)
        {

            int totalQuantity = await _productRepository.GetTotalProductQuantity();
            if (totalQuantity == 0)
            {
                TempData["ErrorMessage"] = "This product is out of stock!";
                return Page();
            }

            int quantity = cart_quantity ?? 1;
              var  product = await _productRepository.GetProductById(productId);
                if (product == null)
                {
                    return NotFound();
                }
          
            await _cartService.AddToCartAsync(product, quantity);
            
            TempData["SuccessMessage"] = "Item added to cart successfully!";
            ViewData["Cultures"] = _translateService.GetAvailableCultures();
            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;

            return Page();
        }

        // Cache the cart count
        public async Task<IActionResult> OnGetCartCountAsync()
        {
            int cartCount = await _cartService.GetCartCountAsync();
            return new JsonResult(new { cartCount });
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

        private readonly HeaderModel? HeaderModelView = new HeaderModel();
    }
}


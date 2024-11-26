namespace ShopWeb.Pages.Products
{
    public class IndexModel : PageModel
    {
        private readonly IProductRepository _productRepository;
        private readonly IMemoryCache _cache;
        private readonly CartService _cartService;

        public IndexModel(IProductRepository productRepository, IMemoryCache cache, CartService cartService)
        {
            _productRepository = productRepository;
            _cache = cache;
            _cartService = cartService;
        }

        public IEnumerable<Product> Products { get; set; } = new List<Product>();
        public IEnumerable<Product> PagedProducts { get; set; } = new List<Product>();
        public int PageIndex { get; set; } = 1;
        public int TotalPages { get; set; }
        public string SearchString { get; set; } = string.Empty;

        private const int PageSize = 9;
        private const string productCache = "ProductList";
        public async Task OnGetAsync(int? pageIndex, string searchString = "")
        {
            // Set up user information from cookies
            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;

            int currentPageIndex = pageIndex ?? 1;


            // Normalize and trim the search string
            SearchString = (searchString ?? string.Empty).Trim().ToLower();

            // Generate a cache key based on the search string and page index
            string cacheKey = string.IsNullOrEmpty(SearchString)
                ? $"{productCache}_Page_{pageIndex}"
                : $"{productCache}_Search_{SearchString}_Page_{pageIndex}";

            // Try to get cached results
            if (!_cache.TryGetValue(cacheKey, out CachedProductData cachedData))
            {
                IQueryable<Product> query = _productRepository.GetProductsAsQueryable()
                    .AsNoTracking(); // Improve performance by disabling tracking


                // Fetch a larger set of products without filtering
                var products = await query
                    .OrderBy(product => product.ProductId) // Ensure consistent ordering
                    .ToListAsync();

                // Perform filtering in-memory if search string is provided
                if (!string.IsNullOrEmpty(SearchString))
                {
                    var normalizedSearchString = VietnameseHelper.RemoveDiacritics(SearchString).ToLower();
                    products = products
                        .Where(product => VietnameseHelper.RemoveDiacritics(product.ProductName).ToLower().Contains(normalizedSearchString))
                        .ToList();
                }

                // Calculate total count and total pages based on filtered data
                var filteredCount = products.Count;
                TotalPages = (int)Math.Ceiling(filteredCount / (double)PageSize);

                // Apply pagination on filtered data
                var pagedProducts = products
                    .Skip((currentPageIndex - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                cachedData = new CachedProductData
                {
                    TotalCount = filteredCount, // Update total count based on filtered data
                    Products = pagedProducts
                };

                var cacheEntryOptions = new MemoryCacheEntryOptions()
                    .SetSlidingExpiration(TimeSpan.FromMinutes(30));
                _cache.Set(cacheKey, cachedData, cacheEntryOptions);
            }
            else
            {
                // Use cached total count to calculate TotalPages
                TotalPages = (int)Math.Ceiling(cachedData.TotalCount / (double)PageSize);
            }

            // Set paged products and current page index
            PagedProducts = cachedData.Products.ToList();
            PageIndex = currentPageIndex;
        }

        // Define a class to store both the paged products and total count
        private class CachedProductData
        {
            public int TotalCount { get; set; }
            public IEnumerable<Product> Products { get; set; }
        }



        public async Task<IActionResult> OnPostAddToCartAsync(int productId, int cart_quantity)
        {
            cart_quantity = 1;
            var product = await _productRepository.GetProductById(productId);
            if (product == null)
            {
                return NotFound();
            }

            await _cartService.AddToCartAsync(product, cart_quantity);

            TempData["SuccessMessage"] = "Item added to cart successfully!";
            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;
            return Page();
        }


        public class CartItem
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public string Image { get; set; }
            public decimal UnitPrice { get; set; }
            public int Quantity { get; set; }
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

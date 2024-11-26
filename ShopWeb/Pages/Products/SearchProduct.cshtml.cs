namespace ShopWeb.Pages.Products
{
    public class SearchProductModel : PageModel
    {
        private readonly IProductRepository _productRepository;
        private readonly IMemoryCache _cache;

       public SearchProductModel(IProductRepository productRepository, IMemoryCache cache)
        {
            _productRepository = productRepository;
            _cache = cache;
      
        }

        public async Task<IActionResult> OnGetAsync(string searchTerm)
        {
            searchTerm = VietnameseHelper.RemoveDiacritics(searchTerm ?? string.Empty).ToLower();
            var cacheKey = $"SearchProducts_{searchTerm}";
            if (!_cache.TryGetValue(cacheKey, out List<string> filteredProducts))
            {
                var allProducts = await _productRepository.GetProducts();
                filteredProducts = allProducts
                     .Where(product => VietnameseHelper.RemoveDiacritics(product.ProductName).ToLower().Contains(searchTerm, StringComparison.OrdinalIgnoreCase))
                    .Select(product => product.ProductName)
                    .ToList();

                var cacheEntryOptions = new MemoryCacheEntryOptions
                {
                    AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(5) // Cache duration
                };
                _cache.Set(cacheKey, filteredProducts, cacheEntryOptions);
            }

     

            return new JsonResult(filteredProducts);
        }
    }
}
namespace ShopWeb.Pages.Admin
{
    public class GetproductModel : PageModel
    {
        private readonly IProductRepository _productRepository;
        private readonly IHubContext<SignalRServer> _signalRHub;
        public GetproductModel(IProductRepository productRepository, IHubContext<SignalRServer> signalRHub)
        {
            _productRepository = productRepository;
            _signalRHub = signalRHub;
        }


        public async Task<IActionResult> OnGetAsync()
        {
            var products = await _productRepository.GetProducts();
            return new JsonResult(products);
        }

      
    }
}

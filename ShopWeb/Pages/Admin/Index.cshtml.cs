namespace ShopWeb.Pages.Admin
{
    public class IndexModel : PageModel
    {
        private readonly IAccountRepository _accountRepository;
        private readonly IOrderRepository _orderRepository;
        private readonly IProductRepository _productRepository;
        private readonly IHubContext<SignalRServer> _signalRHub;
        private readonly StatisticService _statisticService;

        public IndexModel(IAccountRepository accountRepository,
                          IOrderRepository orderRepository,
                          StatisticService statisticService,
                          IProductRepository productRepository,
                          IHubContext<SignalRServer> signalRHub
                          )
        {
            _accountRepository = accountRepository;
            _orderRepository = orderRepository;
            _statisticService = statisticService;
            _productRepository = productRepository;
            _signalRHub = signalRHub;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            var id = HttpContext.Request.Cookies["UserId"];
            if (string.IsNullOrEmpty(id) || !int.TryParse(id, out int uid))
            {
                return RedirectToPage("/Error");
            }
            var user = await _accountRepository.GetAccountById(uid);
            if (user.Type == 1)
            {
                return RedirectToPage("/index");
            }

            await _signalRHub.Clients.All.SendAsync("LoadProductsQuantity");
            return Page();
        }



    }
}

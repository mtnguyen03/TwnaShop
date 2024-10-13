using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Repository;
using Repository.StatictisService;

namespace ShopWeb.Pages.Admin.SignalR
{
    public class GetProdQuantityModel : PageModel
    {
        private readonly IHubContext<SignalRServer> _signalRHub;
        private readonly IProductRepository _productRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly IOrderRepository _orderRepository;

        private readonly StatisticService _statisticService;

        public GetProdQuantityModel(IProductRepository productRepository, IHubContext<SignalRServer> signalRHub,
            IAccountRepository accountRepository,
            IOrderRepository orderRepository,
            StatisticService statisticService

            )
        {
            _productRepository = productRepository;
            _signalRHub = signalRHub;
            _accountRepository = accountRepository;
            _orderRepository = orderRepository;
            _statisticService = statisticService;


        }


        public async Task<IActionResult> OnGetAsync()
        {
            int productsQuantity = await _productRepository.GetTotalProductQuantity();
            var orders = await _orderRepository.GetOrders();
            var orderList = orders.ToList();
            var ListStatic = await _statisticService.GetSalesStatistics(orderList);
            var MonthlyRevenue = await _statisticService.GetMonthlyRevenue(orderList);
            var totalAcc = await _accountRepository.GetTotalAccountsAsync();
     
        

        
            var jsonResponse = new
            {
                SalesStatistics = ListStatic,
                MonthlyRevenue = MonthlyRevenue,
                ProductQuantity = productsQuantity,
                TotalAcc = totalAcc
            };

            return new JsonResult(jsonResponse);
        }

    }
}

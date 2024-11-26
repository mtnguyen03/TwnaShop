namespace ShopWeb.Pages.Admin.SignalR
{
    public class GetProdQuantityModel(
        IProductRepository _productRepository,
        IAccountRepository _accountRepository,
        IOrderRepository _orderRepository,
        StatisticService _statisticService
    ) : PageModel
    {
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

namespace Repository.StatictisService
{
    public class StatisticService
    {
        public async Task<StatisticDto> GetSalesStatistics(List<Order> orders)
        {
            var totalRevenue = orders
                .Where(o => o.OrderDetails != null)
                .Sum(o => o.OrderDetails
                            ?.Sum(od => od.UnitPrice * od.Quantity) ?? 0);

            var totalOrders = orders.Count;
            var successfulOrders = orders.Count(o => o.Status == 1);
            var pendingOrders = orders.Count(o => o.Status == 0);
            var cancelledOrders = orders.Count(o => o.Status == 2);
            var returnedOrders = orders.Count(o => o.Status == 3);
            var disputedOrders = orders.Count(o => o.Status == 4);
            var dongdangyeuCauTra = orders.Count(o => o.Status == 5);
            var donDangyeyCauGiaiQuyet = orders.Count(o => o.Status == 6);




            return new StatisticDto
            {
                TotalRevenue = totalRevenue,
                TotalOrders = totalOrders,
                SuccessfulOrders = successfulOrders,
                PendingOrders = pendingOrders,
                CancelledOrders = cancelledOrders,
                ReturnedOrders = returnedOrders,
                DisputedOrders = disputedOrders,
                DangYeuCauGiaiQuyet = donDangyeyCauGiaiQuyet,
                DangYeuCautra = dongdangyeuCauTra

            };
        }

        public async Task<List<MonthlyRevenueDto>> GetMonthlyRevenue(List<Order> orders)
        {
            var confirmedOrders = orders
                .Where(o => o.Status == 1)  
                .GroupBy(o => new { o.OrderDate.Year, o.OrderDate.Month }) 
                .Select(g => new MonthlyRevenueDto
                {
                    Month = g.Key.Month,
                    Year = g.Key.Year,
                    TotalRevenue = g.Count() * 100000 
                })
                .OrderBy(m => m.Year).ThenBy(m => m.Month) 
                .ToList();

            return confirmedOrders;
        }
    }

    public class MonthlyRevenueDto
    {
        public int Year { get; set; }
        public int Month { get; set; }
        public decimal TotalRevenue { get; set; }
    }


}




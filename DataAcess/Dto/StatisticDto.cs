namespace DataAcess.Dto
{
    public class StatisticDto
    {
        public decimal TotalRevenue { get; set; }
        public int TotalOrders { get; set; }
        public int SuccessfulOrders { get; set; }
        public int PendingOrders { get; set; }
        public int CancelledOrders { get; set; }
        public int ReturnedOrders { get; set; }
        public int DisputedOrders { get; set; }
        public int DangYeuCautra { get; set; }
        public int DangYeuCauGiaiQuyet { get; set; }
    }
}

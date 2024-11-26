namespace DataAcess.Dto
{
    public class OrderReportDto
    {
        public int OrderId { get; set; }
        public int? CustomerId { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime? ShippedDate { get; set; }
        public decimal? Freight { get; set; }
        public string ShipAddress { get; set; }
        public byte Status { get; set; }
        public string CustomerName {  get; set; }
    }
}

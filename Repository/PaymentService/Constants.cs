namespace Repository.PaymentService
{
    public class Constants
    {
        public string ClientId { get; }
        public string ApiKey { get; }
        public string ChecksumKey { get; }

        public Constants(IConfiguration configuration)
        {
            ClientId = configuration["Constants:ClientId"];
            ApiKey = configuration["Constants:ApiKey"];
            ChecksumKey = configuration["Constants:ChecksumKey"];
        }
    }
}

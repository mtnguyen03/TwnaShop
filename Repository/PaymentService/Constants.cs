using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

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

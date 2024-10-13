using Net.payOS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.PaymentService
{
    public class PayProcess
    {
        private readonly PayOS _payOS;
        public PayProcess(PayOS payOS)
        {
            _payOS = payOS;
        }


    }
}

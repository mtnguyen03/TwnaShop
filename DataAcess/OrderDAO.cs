namespace DataAcess
{
    public class OrderDAO
    {
        private static OrderDAO instance;
        public static OrderDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new OrderDAO();
                }
                return instance;
            }
        }

        public async Task<IEnumerable<Order>> GetOrders()
        {
            var _context = new ShopDbContext();
            var list = await _context.Orders.Include(o => o.OrderDetails).OrderBy(o => o.OrderId).ToListAsync();
            return list;
        }

        public async Task<IEnumerable<OrderReportDto>> GetOrdersDto()
        {
            var _context = new ShopDbContext();

            // Join Orders with Accounts to get Customer's Full Name
            var list = await _context.Orders
                .Join(
                    _context.Accounts,          // Join Orders with Accounts
                    order => order.CustomerId,  // Order.CustomerId as key
                    account => account.AccountID,  // Account.AccountID as key
                    (order, account) => new OrderReportDto
                    {
                        CustomerId = order.CustomerId,   // You can keep this if you want the ID too
                        CustomerName = account.FullName, // Fetch the Full Name of the customer
                        OrderDate = order.OrderDate,
                        OrderId = order.OrderId,
                        ShippedDate = order.ShippedDate,
                        Freight = order.Freight,
                        ShipAddress = order.ShipAddress,
                        Status = order.Status
                    }).OrderByDescending(o => o.OrderId)
                .ToListAsync();

            return list;
        }


        public async Task<Order> GetOrderById(int? id)
        {
            var _context = new ShopDbContext();
            var order = await _context.Orders.SingleOrDefaultAsync(o => o.OrderId == id);
            return order;
        }

        public async Task Add(Order order)
        {
            var _db = new ShopDbContext();
            _db.Orders.Add(order);
            await _db.SaveChangesAsync();
        }

        public async Task Update(Order order)
        {
            var _db = new ShopDbContext();
            var existingOrder = await GetOrderById(order.OrderId);
            if (existingOrder != null)
            {
                _db.Orders.Update(order);
                await _db.SaveChangesAsync();
            }
        }

        public async Task Delete(Order order)
        {
            var _db = new ShopDbContext();
            var existingOrder = await GetOrderById(order.OrderId);
            if (existingOrder != null)
            {
                _db.Orders.Remove(order);
                await _db.SaveChangesAsync();
            }
        }
    }
}

namespace DataAcess
{
    public class ProductDAO
    {
        private static ProductDAO instance;
        public static ProductDAO Instance
        {

            get
            {
                if (instance == null)
                {
                    instance = new ProductDAO();
                }
                return instance;
            }
        }



        public async Task<IEnumerable<Product>> GetProducts()
        {
            var _context = new ShopDbContext();
            var list = await _context.Products.AsNoTracking().ToListAsync();

            return list;
        }

        public async Task<int> GetTotalProductQuantity()
        {
            using (var _context = new ShopDbContext())
            {
                var products = await _context.Products.AsNoTracking().Where(p => p.ProductId == 2).ToListAsync();
                var totalQuantity = products.Sum(p => p.QuantityPerUnit);

                return totalQuantity;
            }
        }

        public IQueryable<Product> GetProductsAsQueryable()
        {
            var _context = new ShopDbContext();
            return _context.Products.AsQueryable().AsNoTracking();
        }

        public async Task<Product> GetProductById(int? id)
        {
            var _context = new ShopDbContext();
            var Product = await _context.Products.AsNoTracking().SingleOrDefaultAsync(s => s.ProductId == id);
            return Product;
        }

       


        public async Task Add(Product pro)
        {
            var _db = new ShopDbContext();
            _db.Products.Add(pro);
            await _db.SaveChangesAsync();
        }

        public async Task Update(Product pro)
        {
            var _db = new ShopDbContext();
            var o = await GetProductById(pro.ProductId);
            if (o != null)
            {
                _db.Products.Update(pro);
                await _db.SaveChangesAsync();
            }

        }

        public async Task Delete(Product pro)
        {
            var _db = new ShopDbContext();
            var o = await GetProductById(pro.ProductId);
            if (o != null)
            {
                _db.Products.Remove(pro);
                await _db.SaveChangesAsync();
            }

        }

    }
}

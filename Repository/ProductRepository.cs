namespace Repository
{
    public class ProductRepository : IProductRepository
    {
        public async Task Add(Product pro) => await ProductDAO.Instance.Add(pro);
        public async Task Delete(Product pro) => await ProductDAO.Instance.Delete(pro);
        public async Task<Product> GetProductById(int id) => await ProductDAO.Instance.GetProductById(id);
        public async Task<IEnumerable<Product>> GetProducts() => await ProductDAO.Instance.GetProducts();
        public async Task Update(Product pro) => await ProductDAO.Instance.Update(pro);
        public  IQueryable<Product> GetProductsAsQueryable() => ProductDAO.Instance.GetProductsAsQueryable();
        public async Task<int> GetTotalProductQuantity()  => await ProductDAO.Instance.GetTotalProductQuantity();
    }
}

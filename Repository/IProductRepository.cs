﻿namespace Repository
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetProducts();
        Task<Product> GetProductById(int id);
        Task Add(Product pro);
        Task Update(Product pro);
        Task Delete(Product pro);
        IQueryable<Product> GetProductsAsQueryable();
        Task<int> GetTotalProductQuantity();
    }
}

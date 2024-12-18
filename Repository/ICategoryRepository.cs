﻿namespace Repository
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> GetCategoryAll();
        Task<Category> GetCategoryById(int id);
        Task Add(Category category);
        Task Update(Category category);
        Task Delete(int id);
    }
}

namespace Repository
{
    public interface IAccountRepository
    {
        Task<IEnumerable<Account>> GetAccounts();
        Task<Account> GetAccountById(int id);
        Task Add(Account pro);
        Task Update(Account pro);
        Task Delete(Account pro);
        Task<Account> GetAccountByEmail(string pro);
        Task ResetPassword(string email, string newPassword);
        Task<int> GetTotalAccountsAsync();
    }
}

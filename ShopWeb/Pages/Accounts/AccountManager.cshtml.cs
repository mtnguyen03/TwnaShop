namespace ShopWeb.Pages.Accounts
{
    public class AccountManagerModel(IAccountRepository _accountRepository) : PageModel
    {

        [BindProperty]
        public IList<Account> Accounts { get; set; }

        public async Task OnGetAsync()
        {

            Accounts = (await _accountRepository.GetAccounts()).ToList();

        }

        public async Task<IActionResult> OnGetDeleteAccountAsync(int id)
        {
            var account = await _accountRepository.GetAccountById(id);
            if (account == null)
            {
                return NotFound();
            }

            await _accountRepository.Delete(account);

            return RedirectToPage("./AccountManager");
        }
    }
}

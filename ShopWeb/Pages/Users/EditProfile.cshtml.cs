namespace ShopWeb.Pages.Users
{
    public class EditProfileModel : PageModel
    {
        private readonly IAccountRepository _accountRepository = new AccountRepository();

        public EditProfileModel()
        {
            HeaderModelView = new HeaderModel();
        }

        public class HeaderModel
        {
            public string? UserName { get; set; }
            public string? Type { get; set; }
            public string? WelcomeMessage { get; set; }
        }

        public HeaderModel? HeaderModelView = new HeaderModel();

        [BindProperty]
        public Account UserAccount { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {
            var id = HttpContext.Request.Cookies["UserId"];
            if (string.IsNullOrEmpty(id) || !int.TryParse(id, out int uid))
            {
                return RedirectToPage("/Error");
            }

            UserAccount = await _accountRepository.GetAccountById(uid);
 
            if (UserAccount == null)
            {
                return RedirectToPage("/Error");
            }

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            await _accountRepository.Update(UserAccount);
            HttpContext.Response.Cookies.Append("UserName", UserAccount.FullName);

  
            HeaderModelView.UserName = UserAccount.UserName;
            ViewData["UserName"] = HeaderModelView.UserName;

            return RedirectToPage("/Users/EditProfile");
        }
    }
}

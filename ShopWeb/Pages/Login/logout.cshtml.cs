namespace ShopWeb.Pages.Login
{
    public class logoutModel : PageModel
    {


        public async Task<IActionResult> OnGetAsync()
        {

            await HttpContext.SignOutAsync();

            foreach (var user in Request.Cookies.Keys)
            {
                Response.Cookies.Delete(user);
            }


            HttpContext.Session.Clear();

            return RedirectToPage("/index");
        }

    }
}

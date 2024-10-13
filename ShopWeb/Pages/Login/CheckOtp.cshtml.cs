using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Repository;
using Repository.TranslateService;

namespace ShopWeb.Pages.Login
{

    public class CheckOtpModel : PageModel
    {
        private readonly IOtpService _otpService;
        private readonly TranslateService _translateService;

        public CheckOtpModel(IOtpService otpService,
            TranslateService translateService
            )
        {
            _otpService = otpService;
            _translateService = translateService;
        }

        [BindProperty(SupportsGet = true)]
        public string Email { get; set; }

        [BindProperty]
        public string Otp { get; set; }

        public void OnGet()
        {
            ViewData["Cultures"] = _translateService.GetAvailableCultures();
        }
        void PrintNumber()
        {

        }
        public IActionResult OnPost()
        {
            ViewData["Cultures"] = _translateService.GetAvailableCultures();
            Task task = new Task(() => PrintNumber());
            if (!ModelState.IsValid)
            {
                return Page();
            }

            if (_otpService.ValidateOtp(Email, Otp))
            {
                return RedirectToPage("/Login/resetpass", new { email = Email });
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid OTP.");
                return Page();
            }
        }
    }
}


using Azure;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using Repository.MailService;
using Repository.TranslateService;
using System.Security.Policy;
using Repository.CartService;


namespace ShopWeb.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ISendGmailService _sendGmailService;
        private readonly TranslateService _translateService;


        public IndexModel(ILogger<IndexModel> logger,
                          ISendGmailService sendGmailService,
                          TranslateService translateService
                       )
        {
            HeaderModelView = new HeaderModel();
            _sendGmailService = sendGmailService;
            _translateService = translateService;

        }

        [BindProperty]
        public string Name { get; set; }

        [BindProperty]
        public string Email { get; set; }

        public IList<CartItem> CartItems { get; set; } = new List<CartItem>();

        [BindProperty]
        public string Subject { get; set; }

        [BindProperty]
        public string Message { get; set; }

        public class HeaderModel
        {
            public string? UserName { get; set; }
            public string? Type { get; set; }
            public string? WelcomeMessage { get; set; }
        }

        public HeaderModel? HeaderModelView = new HeaderModel();

        public async Task<IActionResult> OnPostSetLanguage(string culture, string returnUrl)
        {
            await _translateService.SetLanguage(culture, Response);

            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;

            if (string.IsNullOrEmpty(returnUrl))
            {
                returnUrl = Url.Page("/Index");
            }

            return LocalRedirect(returnUrl);
        }

        public async Task<IActionResult> OnGet()
        {
            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;
            var cultures = await _translateService.GetAvailableCultures();
            ViewData["Cultures"] = cultures;

            return Page();
        }

        public async Task<IActionResult> OnPostSendMailContact()
        {
            HeaderModelView.UserName = HttpContext.Request.Cookies["UserName"] ?? string.Empty;
            ViewData["UserName"] = HeaderModelView.UserName;

            if (!ModelState.IsValid)
            {
                ViewData["Cultures"] = _translateService.GetAvailableCultures();
                return Page();
            }

            string body = $"<p><strong>Name:</strong> {Name}</p>" +
                          $"<p><strong>Email:</strong> {Email}</p>" +
                          $"<p><strong>Message:</strong></p>" +
                          $"<p>{Message}</p>";

            await _sendGmailService.SendMail(new MailContent
            {
                To = Email,
                Subject = Subject,
                Body = body
            });

            return new JsonResult(new { success = true, message = "Send Mail Success !!!" });
        }
    }
}
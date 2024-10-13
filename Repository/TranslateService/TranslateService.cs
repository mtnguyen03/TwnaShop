using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace Repository.TranslateService
{
    public class TranslateService
    {
        private readonly List<CultureInfo> _defaultCultures = new List<CultureInfo>
        {
            new CultureInfo("vi-VN"),
            new CultureInfo("en-US"),
        };

        public async Task<List<SelectListItem>> GetAvailableCultures()
        {
            await Task.Yield(); 
            CultureInfo[] cultures = CultureInfo.GetCultures(CultureTypes.AllCultures);
            var cultureItems = cultures.Where(c => _defaultCultures.Contains(c))
                .Select(c => new SelectListItem { Value = c.Name, Text = c.DisplayName })
                .ToList();

            return cultureItems;
        }

        public async Task SetLanguage(string culture, HttpResponse response)
        {
            await Task.Run(() =>
            {
                response.Cookies.Append(
                    CookieRequestCultureProvider.DefaultCookieName,
                    CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(culture)),
                    new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) }
                );
            });
        }

        public int GetCurrentCulture(HttpContext context)
        {
            var requestCulture = context.Features.Get<IRequestCultureFeature>()?
                .RequestCulture?.Culture ??
                CultureInfo.CurrentCulture;

            return requestCulture.Name switch
            {
                "vi-VN" => 1,
                "en-US" => 2,
                _ => 2
            };
        }
    }
}

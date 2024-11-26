public class CaptchaService
{
    private readonly IConfiguration _configuration;
    private readonly HttpClient _httpClient;

    public CaptchaService(IConfiguration configuration)
    {
        _configuration = configuration;
        _httpClient = new HttpClient();
    }

    public async Task<bool> VerifyCaptchaAsync(string captchaResponse)
    {
        string secretKey = _configuration["Captcha:SecretKey"]; // Store your CAPTCHA secret key in appsettings.json
        var content = new FormUrlEncodedContent(new[]
        {
            new KeyValuePair<string, string>("secret", secretKey),
            new KeyValuePair<string, string>("response", captchaResponse)
        });

        var response = await _httpClient.PostAsync("https://challenges.cloudflare.com/turnstile/v0/siteverify", content);
        var jsonString = await response.Content.ReadAsStringAsync();
        var jsonResponse = JsonSerializer.Deserialize<CaptchaResponse>(jsonString);

        return jsonResponse != null && jsonResponse.success;
    }

    // Class to map CAPTCHA response
    private class CaptchaResponse
    {
        public bool success { get; set; }
        public DateTime challenge_ts { get; set; }
        public string hostname { get; set; }
    }
}

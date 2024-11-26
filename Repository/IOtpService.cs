namespace Repository
{
    public interface IOtpService
    {
        void GenerateOtp(string email, out string otp);
        bool ValidateOtp(string email, string otp);
    }
}

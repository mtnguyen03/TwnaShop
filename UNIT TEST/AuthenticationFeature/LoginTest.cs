using BusinessObject;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Moq;
using Repository;
using Repository.TranslateService;
using System.Security.Claims;
using System.Threading.Tasks;
using Xunit;

public class LoginPageTests
{
    private readonly Mock<SignInManager<IdentityUser>> _signInManagerMock;
    private readonly Mock<IAccountRepository> _accountRepositoryMock;
    private readonly Mock<TranslateService> _translateServiceMock;

    public LoginPageTests()
    {
        // Mock UserManager<IdentityUser>
        var userStoreMock = new Mock<IUserStore<IdentityUser>>();
        var userManagerMock = new Mock<UserManager<IdentityUser>>(userStoreMock.Object, null, null, null, null, null, null, null, null);

        _signInManagerMock = new Mock<SignInManager<IdentityUser>>(userManagerMock.Object,
            new Mock<IHttpContextAccessor>().Object,
            new Mock<IUserClaimsPrincipalFactory<IdentityUser>>().Object,
            null, null, null, null);

        _accountRepositoryMock = new Mock<IAccountRepository>();
        _translateServiceMock = new Mock<TranslateService>();
    }





    [Fact]
    public async Task OnPostDbLoginAsync_InvalidDbLogin_ShowsError2()
    {
        // Arrange
        _accountRepositoryMock
            .Setup(x => x.GetAccountByEmail(It.IsAny<string>()))
            .ReturnsAsync((Account)null);

        var model = new ShopWeb.Pages.Login.IndexModel(
            _signInManagerMock.Object,
            _accountRepositoryMock.Object,
            _translateServiceMock.Object)
        {
            Input = new ShopWeb.Pages.Login.IndexModel.InputModel
            {
                Email = "wrong@example.com",
                Password = "wrongpassword"
            }
        };

        // Act
        var result = await model.OnPostDbLoginAsync();

        // Assert
        Assert.IsType<PageResult>(result);
        Assert.Equal("Invalid login attempt", model.ErrorMessage);
    }



}

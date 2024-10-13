using BusinessObject;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Repository.CartService
{
    public class CartService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CartService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }
        public async Task AddToCartAsync(Product product, int quantity)
        {
            var cart = await GetCartAsync();
            var cartItems = string.IsNullOrEmpty(cart)
                ? new List<CartItem>()
                : JsonSerializer.Deserialize<List<CartItem>>(cart);

            var cartItem = cartItems.Find(ci => ci.ProductId == product.ProductId);
            if (cartItem == null)
            {
                cartItems.Add(new CartItem
                {
                    ProductId = product.ProductId,
                    ProductName = product.ProductName,
                    UnitPrice = product.UnitPrice,
                    Quantity = quantity,
                    Image = product.ProductImage
                });
            }
            else
            {
                cartItem.Quantity += quantity;
            }

            await SaveCartAsync(JsonSerializer.Serialize(cartItems));
        }

        private async Task<string> GetCartAsync()
        {
            await Task.Delay(10);
            return _httpContextAccessor.HttpContext.Session.GetString("Cart");
        }

        private async Task SaveCartAsync(string cart)
        {
            await Task.Delay(10);
            _httpContextAccessor.HttpContext.Session.SetString("Cart", cart);
        }




        public async Task<int> GetCartCountAsync()
        {
            var cart = await GetCartAsync();
            var cartItems = string.IsNullOrEmpty(cart)
                ? new List<CartItem>()
                : JsonSerializer.Deserialize<List<CartItem>>(cart);

            // Sum the quantity of all cart items
            return cartItems.Sum(ci => ci.Quantity);
        }
    }

    public class CartItem
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Image { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }
    }

}

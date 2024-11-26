namespace BusinessObject
{
    public partial class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProductId { get; set; }
        public int CategoryId { get; set; }
        public string ProductName { get; set; }
        public string ProductImage { get; set; }
        public decimal UnitPrice { get; set; }
        public int QuantityPerUnit { get; set; }


        public virtual Category? Categories { get; set; }
        public virtual ICollection<OrderDetail>? OrderDetails { get; set; }
        public virtual ICollection<Comment>? Comments { get; set; }
    }
}

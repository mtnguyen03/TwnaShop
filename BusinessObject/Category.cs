namespace BusinessObject
{
    public partial class Category
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }

        public virtual ICollection<Product>? Products { get; set; }
    }
}

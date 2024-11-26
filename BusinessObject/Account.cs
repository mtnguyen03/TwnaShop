namespace BusinessObject
{

    public partial class Account
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AccountID { get; set; }
        public string Photo { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public byte Type { get; set; }
        public byte Status { get; set; }
        public string Email { get; set; }
        
        public string Address { get; set; }

        public virtual ICollection<Order>? Orders { get; set; }
        public virtual ICollection<Notification>? Notifications { get; set; }
    }
}

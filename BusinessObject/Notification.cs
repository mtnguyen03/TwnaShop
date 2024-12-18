﻿namespace BusinessObject
{
    public class Notification
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int NotificationID { get; set; }
        public int UserID { get; set; }
        public string Title { get; set; }
        public string Photo { get; set; }
        public string MessageContent { get; set; }
        public DateTime NotificationDate { get; set; } = DateTime.Now;
        public bool IsRead { get; set; } = false;

        public virtual Account User { get; set; }
    }
}

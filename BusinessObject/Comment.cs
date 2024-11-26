namespace BusinessObject
{
    public class Comment
    {
        public int Id { get; set; }

        public int? UserId { get; set; }
        public Account? User { get; set; }

        public int? ProductId { get; set; }
        public Product? Product { get; set; }

        [Required]
        public string? CommentText { get; set; }

        [Range(0, 5)]
        public int? Rate { get; set; }

        public int? UserReplyId { get; set; }
        [JsonIgnore]
        public Comment? UserReply { get; set; }
        public List<Comment> UserReplies { get; set; } 

        [DataType(DataType.DateTime)]
        public DateTime? CreatedAt { get; set; }

        [DataType(DataType.DateTime)]
        public DateTime? UpdatedAt { get; set; }
    }
}

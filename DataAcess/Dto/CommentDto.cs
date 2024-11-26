namespace DataAcess.Dto
{
    public class CommentDto
    {
        public int Id { get; set; }
        public string? UserName { get; set; }
        public int? UserId { get; set; }
        public string? Photo { get; set; }
        public int? ProductId { get; set; }
        public string? CommentText { get; set; }
        [DataType(DataType.DateTime)]
        [Range(0, 5)]
        public int? Rate { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? UserReplyId { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime? UpdatedAt { get; set; }
        public List<UserReplyDto>? UserReplies { get; set; }

    }
}

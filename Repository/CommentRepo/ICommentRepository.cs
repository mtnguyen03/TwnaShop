namespace Repository.CommentRepo
{
    public interface ICommentRepository
    {
        Task<IEnumerable<Comment>> GetAllCommentsAsync();
        Task<Comment?> GetCommentByIdAsync(int id);
        Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync(int productId);
        Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync2(int productId, int userCommentId);
        Task<Comment> AddCommentAsync(Comment comment);
        Task UpdateCommentAsync(int id, CommentDto commentDto);
        Task DeleteCommentAsync(int id);
    }
}

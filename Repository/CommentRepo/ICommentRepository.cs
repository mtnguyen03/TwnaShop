using BusinessObject;
using DataAcess.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.CommentRepo
{
    public interface ICommentRepository
    {
        Task<IEnumerable<Comment>> GetAllCommentsAsync();
        Task<Comment?> GetCommentByIdAsync(int id);
        Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync(int productId);
        Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync2(int productId, int userCommentId);
        Task<Comment> AddCommentAsync(Comment comment);
        Task UpdateCommentAsync(Comment comment);
        Task DeleteCommentAsync(int id);
    }
}

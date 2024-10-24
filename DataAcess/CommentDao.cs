using BusinessObject;
using DataAcess.Dto;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CommentDao
    {
        private static CommentDao _instance;
        private readonly ShopDbContext _context;

        // Singleton Instance
        public static CommentDao Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new CommentDao();
                }
                return _instance;
            }
        }

        private CommentDao()
        {
            _context = new ShopDbContext();
        }

        public async Task<IEnumerable<Comment>> GetAllCommentsAsync()
        {
            return await _context.Comments
                .Include(c => c.User)
                .Include(c => c.Product)
                .Include(c => c.UserReplies)
                .ToListAsync();
        }

        public async Task<Comment?> GetCommentByIdAsync(int id)
        {
            return await _context.Comments
                .Include(c => c.User)
                .Include(c => c.Product)
                .Include(c => c.UserReplies)
                .FirstOrDefaultAsync(c => c.Id == id);
        }

        public async Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync(int productId)
        {
            return await _context.Comments
                 .Include(c => c.User)
                 .Include(c => c.Product)
                 .Include(c => c.UserReplies)
                 .Select(c => new CommentDto
                 {
                     Id = c.Id,
                     CommentText = c.CommentText,
                     UserName = c.User.FullName,
                     UserId = c.User.AccountID,
                     ProductId = c.ProductId,
                     UserReplyId = c.UserReplyId,
                     CreatedAt = c.CreatedAt,
                     UpdatedAt = c.UpdatedAt,
                     Photo = c.User.Photo,
                     Rate = c.Rate,
                     UserReplies = c.UserReplies.Select(ur => new UserReplyDto // Map replies to UserReplyDto
                     {
                         Id = ur.Id,
                         UserId = ur.UserId,
                         UserName = ur.User.FullName,
                         Photo = ur.User.Photo,
                         ProductId = ur.ProductId,
                         UserReplyId = ur.UserReplyId,
                         CreatedAt = ur.CreatedAt,
                         Content = ur.CommentText
                     }).ToList() // Convert to list
                 })
                 .Where(c => c.Rate != null).OrderByDescending(c => c.Id)
                 .ToListAsync();
        }

        public async Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync2(int productId, int userCommentId)
        {
            return await _context.Comments
                 .Include(c => c.User)
                 .Include(c => c.Product)
                 .Include(c => c.UserReplies)
                 .Select(c => new CommentDto
                 {
                     Id = c.Id,
                     CommentText = c.CommentText,
                     UserName = c.User.FullName,
                     UserId = c.User.AccountID,
                     ProductId = c.ProductId,
                     UserReplyId = c.UserReplyId,
                     CreatedAt = c.CreatedAt,
                     UpdatedAt = c.UpdatedAt,
                     Photo = c.User.Photo,
                     Rate = c.Rate,
                     UserReplies = c.UserReplies.Select(ur => new UserReplyDto // Map replies to UserReplyDto
                     {
                         Id = ur.Id,
                         UserId = ur.UserId,
                         UserName = ur.User.FullName,
                         Photo = ur.User.Photo,
                         ProductId = ur.ProductId,
                         UserReplyId = ur.UserReplyId,
                         CreatedAt = ur.CreatedAt,
                         Content = ur.CommentText
                     }).ToList() // Convert to list
                 })
                 .Where(c => c.Rate == null && c.UserReplyId == userCommentId)
                 .ToListAsync();
        }


        public async Task<Comment> AddCommentAsync(Comment comment)
        {
            _context.Comments.Add(comment);
            await _context.SaveChangesAsync();
            return comment;
        }

        public async Task UpdateCommentAsync(Comment comment)
        {
            _context.Comments.Update(comment);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteCommentAsync(int id)
        {
            var comment = await _context.Comments.FindAsync(id);
            if (comment != null)
            {
                _context.Comments.Remove(comment);
                await _context.SaveChangesAsync();
            }
        }
    }
}

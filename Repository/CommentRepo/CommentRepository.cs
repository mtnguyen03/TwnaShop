using BusinessObject;
using DataAccess;
using DataAcess;
using DataAcess.Dto;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.CommentRepo
{
    public class CommentRepository : ICommentRepository
    {

        public async Task<IEnumerable<Comment>> GetAllCommentsAsync()
        {
            return await CommentDao.Instance.GetAllCommentsAsync();
        }

        public async Task<Comment?> GetCommentByIdAsync(int id)
        {
            return await CommentDao.Instance.GetCommentByIdAsync(id);
        }

        public async Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync(int productId)
        {
            return await CommentDao.Instance.GetCommentsByProductIdAsync(productId);
        }

        public async Task<IEnumerable<CommentDto>> GetCommentsByProductIdAsync2(int productId, int userCommentId)
        {
            return await CommentDao.Instance.GetCommentsByProductIdAsync2(productId,  userCommentId);
        }

        public async Task<Comment> AddCommentAsync(Comment comment)
        {
            return await CommentDao.Instance.AddCommentAsync(comment);
        }

        public async Task UpdateCommentAsync(int id, CommentDto commentDto)
        {
            await CommentDao.Instance.UpdateCommentAsync(id,commentDto);
        }

        public async Task DeleteCommentAsync(int id)
        {
            await CommentDao.Instance.DeleteCommentAsync(id);
        }


    }

}

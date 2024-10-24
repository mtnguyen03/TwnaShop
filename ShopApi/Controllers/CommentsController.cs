using BusinessObject;
using DataAcess.Dto;
using Microsoft.AspNetCore.Mvc;
using Repository.CommentRepo;
using System.Xml.Linq;

namespace ShopApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentsController : ControllerBase
    {
        private readonly ICommentRepository _commentRepository;

        public CommentsController(ICommentRepository commentRepository)
        {
            _commentRepository = commentRepository;
        }

        // Get comments for a product
        [HttpGet]
        public async Task<IActionResult> GetComments()
        {
            var comments = await _commentRepository.GetCommentsByProductIdAsync(1);
            return Ok(comments);
        }
        [HttpGet("/reply/{id}")]
        public async Task<IActionResult> GetReplys(int id)
        {
            var comments = await _commentRepository.GetCommentsByProductIdAsync2(1,id);
            return Ok(comments);
        }

        // Add a new comment
        [HttpPost]
        public async Task<IActionResult> AddComment([FromBody] Comment comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var newComment = new Comment
            {
                UserId = comment.UserId,
                ProductId = comment.ProductId,
                CommentText = comment.CommentText,
                Rate = comment.Rate,
                CreatedAt = DateTime.UtcNow
            };

            await _commentRepository.AddCommentAsync(newComment);
            return Ok(newComment);
        }

        // Add a new AddReply
        [HttpPost("addReply")]
        public async Task<IActionResult> AddReply([FromBody] Comment comment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var newComment = new Comment
            {
                UserId = comment.UserId,
                ProductId = 1,
                CommentText = comment.CommentText,
                CreatedAt = DateTime.UtcNow,
                UserReplyId = comment.UserReplyId,
                Rate = 1
            };

            await _commentRepository.AddCommentAsync(newComment);
            return Ok(newComment);
        }


    }
}


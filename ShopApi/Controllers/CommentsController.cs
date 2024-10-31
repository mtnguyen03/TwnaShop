using BusinessObject;
using DataAcess.Dto;
using Microsoft.AspNetCore.JsonPatch;
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
            var comments = await _commentRepository.GetCommentsByProductIdAsync(2);
            return Ok(comments);
        }
        [HttpGet("/reply/{id}")]
        public async Task<IActionResult> GetReplys(int id)
        {
            var comments = await _commentRepository.GetCommentsByProductIdAsync2(2,id);
            return Ok(comments);
        }

        // Add a new comment
        [HttpPost]
        public async Task<IActionResult> AddComment([FromBody] Comment comment)
        {
            // Validate the model
            if (!ModelState.IsValid)
            {
                return BadRequest(false); // Return false if model state is invalid
            }

            var newComment = new Comment
            {
                UserId = comment.UserId,
                ProductId = comment.ProductId,
                CommentText = comment.CommentText,
                Rate = comment.Rate,
                CreatedAt = DateTime.UtcNow
            };

            // Attempt to add the comment
            var addedComment = await _commentRepository.AddCommentAsync(newComment);

            // Check if the comment was added
            if (addedComment == null)
            {
                // Handle the case where the comment was not added
                return BadRequest(false); // Return false indicating failure
            }

            return Ok(true); // Return true indicating success
        }



        // Delete a comment
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteComment(int id)
        {
            var comment = await _commentRepository.GetCommentByIdAsync(id);
            if (comment == null)
            {
                return NotFound(new { message = "Comment not found." });
            }

            await _commentRepository.DeleteCommentAsync(id);
            return Ok(new { message = "Comment deleted successfully." });
        }


        [HttpPatch("{id}")]
        public async Task<IActionResult> UpdateComment(int id, [FromBody] JsonPatchDocument<CommentDto> patchDoc)
        {
            if (patchDoc == null)
            {
                return BadRequest("Invalid patch document.");
            }

            try
            {
                var commentDto = new CommentDto(); // Create a new instance of the DTO
                patchDoc.ApplyTo(commentDto, ModelState); // Apply the patch to the DTO

                // Validate the patched DTO
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                // Call the repository method to update the comment
                await _commentRepository.UpdateCommentAsync(id, commentDto);
                return NoContent(); // Respond with 204 No Content
            }
            catch (KeyNotFoundException)
            {
                return NotFound(new { message = "Comment not found." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = ex.Message }); // Handle other exceptions
            }
        }



    }
}


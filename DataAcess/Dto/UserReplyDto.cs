using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcess.Dto
{
    public class UserReplyDto
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string UserName { get; set; }
        public string Photo { get; set; } // Nullable if photo can be null
        public int? ProductId { get; set; }
        public string Content { get; set; }
        public int? UserReplyId { get; set; }     
        public DateTime? CreatedAt { get; set; }
    }
}

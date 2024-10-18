using BusinessObject;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Nest;
using Repository;
using System.Drawing.Printing;

namespace ShopWeb.Notifications
{
    public class GetNotification : PageModel
    {
        private readonly INotificationRepository _noti;
        private readonly IHubContext<SignalRServer> _signalRHub;
        public GetNotification(INotificationRepository noti, IHubContext<SignalRServer> signalRHub)
        {
            _noti = noti;
            _signalRHub = signalRHub;
        }


        public async Task<IActionResult> OnGetAsync()
        {
            var id = HttpContext.Request.Cookies["UserId"];
            if (string.IsNullOrEmpty(id) || !int.TryParse(id, out int uid))
            {
                return new JsonResult(new { success = false, data = new object[0] });
            }
            var noti = await _noti.GetNotificationByUserIdAsync(uid);
            return new JsonResult(new { success = true, data = noti });
        }
        public async Task<IActionResult> OnGetNotiCountAsync()
        {
            var id = HttpContext.Request.Cookies["UserId"];
            if (string.IsNullOrEmpty(id) || !int.TryParse(id, out int uid))
            {
                return new JsonResult(new { noti = 0 });
            }
            var noti = await _noti.GetTotalNotiQuantityAsync(uid);
            return new JsonResult(new { noti });
        }

        public async Task<IActionResult> OnGetDeleteAsync(int id)
        {
            if (id <= 0)
            {
                return BadRequest(new { success = false, message = "Invalid notification ID." });
            }

            await _noti.Delete(id); // Call the delete method from your repository

            return new JsonResult(new { success = true });
        }


    }
}

namespace ShopWeb.Notifications
{
    public class GetNotification(
               INotificationRepository _noti,
    IHubContext<SignalRServer> _signalRHub
        ) : PageModel
    {

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

            await _noti.Delete(id);

            return new JsonResult(new { success = true });
        }


    }
}

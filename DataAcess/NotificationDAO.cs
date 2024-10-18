using BusinessObject;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;

namespace DataAccess
{
    public class NotificationDAO
    {
        private static NotificationDAO _context;
        public static NotificationDAO Instance
        {
            get
            {
                if (_context == null)
                {
                    _context = new NotificationDAO();
                }
                return _context;
            }
        }

        // Retrieve all notifications
        public async Task<IEnumerable<Notification>> GetNotificationAll()
        {
            using (var _context = new ShopDbContext())
            {
                var list = await _context.Notifications.ToListAsync();
                return list;
            }
        }

        // Retrieve notifications by user ID
        public async Task<IEnumerable<Notification>> GetNotificationsByUserIdAsync(int? userId)
        {
            using (var _context = new ShopDbContext())
            {
                var notifications = await _context.Notifications
                                                  .Where(n => n.UserID == userId).OrderByDescending(o => o.NotificationDate)
                                                  .ToListAsync();
                return notifications;
            }
        }

        // Get the total notification count for a user
        public async Task<int> GetTotalNotiQuantityAsync(int? userId)
        {
            using (var _context = new ShopDbContext())
            {
                var totalQuantity = await _context.Notifications
                                                  .Where(n => n.UserID == userId)
                                                  .CountAsync();
                return totalQuantity;
            }
        }

        // Add a new notification
        public async Task Add(Notification pro)
        {
            using (var _db = new ShopDbContext())
            {
                _db.Notifications.Add(pro);
                await _db.SaveChangesAsync();
            }
        }
        public async Task Delete(int notificationId)
        {
            // Using the 'using' statement to ensure proper disposal of the context
            using (var _db = new ShopDbContext())
            {
                // Use FirstOrDefaultAsync to fetch the notification
                var notification = await _db.Notifications.FirstOrDefaultAsync(n => n.NotificationID == notificationId);

                // Check if the notification exists
                if (notification != null)
                {
                    _db.Notifications.Remove(notification); // Remove the notification
                    await _db.SaveChangesAsync(); // Save changes to the database
                }
                // Optionally, handle the case where the notification was not found
            }
        }


        // Delete all notifications for a specific user
        public async Task<bool> DeleteAll(int? userId)
        {
            using (var _db = new ShopDbContext())
            {
                var notifications = await _db.Notifications
                                             .Where(n => n.UserID == userId)
                                             .ToListAsync();
                if (notifications.Any())
                {
                    _db.Notifications.RemoveRange(notifications);
                    await _db.SaveChangesAsync();
                    return true;
                }
            }
            return false;
        }
    }
}

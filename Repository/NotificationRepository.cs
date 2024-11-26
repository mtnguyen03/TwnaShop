namespace Repository
{
    public class NotificationRepository : INotificationRepository
    {
        // Fetches notifications for a specific user by their ID
        public async Task<IEnumerable<Notification>> GetNotificationByUserIdAsync(int userId)
        {
            return await NotificationDAO.Instance.GetNotificationsByUserIdAsync(userId);
        }

        // Fetches total notification quantity for a specific user
        public async Task<int> GetTotalNotiQuantityAsync(int? userId)
        {
            return await NotificationDAO.Instance.GetTotalNotiQuantityAsync(userId);
        }

        // Adds a new notification
        public async Task Add(Notification notification)
        {
            await NotificationDAO.Instance.Add(notification);
        }

        // Deletes all notifications for a specific user
        public async Task<bool> DeleteAll(int? userId)
        {
            if (userId <= 0) // Check for invalid ID
            {
                return false; // Invalid notification ID
            }

            return await NotificationDAO.Instance.DeleteAll(userId); // Ensure Delete method returns a bool
        }

        // Deletes a specific notification by its ID
        public async Task Delete(int notificationId) // Renamed to match the purpose
        {
          
             await NotificationDAO.Instance.Delete(notificationId); // Ensure Delete method returns a bool
        }
    }
}

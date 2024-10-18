using BusinessObject;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Repository
{
    /// <summary>
    /// Interface for notification repository operations.
    /// </summary>
    public interface INotificationRepository
    {
        /// <summary>
        /// Fetches notifications for a specific user by their ID.
        /// </summary>
        /// <param name="userId">The ID of the user.</param>
        /// <returns>A task that represents the asynchronous operation, containing the list of notifications.</returns>
        Task<IEnumerable<Notification>> GetNotificationByUserIdAsync(int userId);

        /// <summary>
        /// Gets the total quantity of notifications for a specific user.
        /// </summary>
        /// <param name="userId">The ID of the user.</param>
        /// <returns>A task that represents the asynchronous operation, containing the total quantity of notifications.</returns>
        Task<int> GetTotalNotiQuantityAsync(int? userId);

        /// <summary>
        /// Adds a new notification.
        /// </summary>
        /// <param name="notification">The notification to be added.</param>
        /// <returns>A task that represents the asynchronous operation.</returns>
        Task Add(Notification notification);

        /// <summary>
        /// Deletes all notifications for a specific user.
        /// </summary>
        /// <param name="userId">The ID of the user whose notifications should be deleted.</param>
        /// <returns>A task that represents the asynchronous operation, indicating success or failure.</returns>
        Task<bool> DeleteAll(int? userId);

        /// <summary>
        /// Deletes a specific notification by its ID.
        /// </summary>
        /// <param name="id">The ID of the notification to be deleted.</param>
        /// <returns>A task that represents the asynchronous operation, indicating success or failure.</returns>

        Task Delete(int pro);
    }
}

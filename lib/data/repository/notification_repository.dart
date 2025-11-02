import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/notification_model.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<NotificationModel>> sendNotification(NotificationModel notification) async {
    final result = await _apiClient.post<Map<String, dynamic>>(
      '/notifications/notification/send/',
      data: notification.toJson(),
    );

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(NotificationModel.fromJson(data)),
    );
  }
}

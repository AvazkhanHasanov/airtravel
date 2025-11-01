import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/notification_send_model.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<NotificationSendModel>> sendNotification(NotificationSendModel notification) async {
    final result = await _apiClient.post<Map<String, dynamic>>(
      '/notifications/notification/send/',
      data: notification.toJson(),
    );

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(NotificationSendModel.fromJson(data)),
    );
  }
}

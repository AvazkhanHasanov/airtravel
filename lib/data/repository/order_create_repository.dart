import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/order_create_model.dart';

class OrderRepository {
  final ApiClient apiClient;

  OrderRepository({required this.apiClient});

  Future<Result<OrderCreateModel>> createOrder(OrderCreateModel order) async {
    final result = await apiClient.post<Map<String, dynamic>>(
      '/orders/order/create/',
      data: order.toJson(),
    );
    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(OrderCreateModel.fromJson(data)),
    );
  }
}

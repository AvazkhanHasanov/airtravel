import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/orders/order_model.dart';

class OrderListRepository {
  final ApiClient _apiClient;

  OrderListRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<OrderModel>>> getOrderList({Map<String, dynamic>? queryParams}) async {
    final result = await _apiClient.get('/orders/order/list/', queryParams: queryParams);
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok((data).map((e) => OrderModel.fromJson(e)).toList()),
    );
  }
}

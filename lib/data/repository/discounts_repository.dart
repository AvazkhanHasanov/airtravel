import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/discounts_model.dart';

class DiscountsRepository {
  final ApiClient _apiClient;

  DiscountsRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<DiscountModel>>> getDiscountList() async {
    final result = await _apiClient.get<List>('/discounts/discount/list/');
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => DiscountModel.fromJson(e)).toList()),
    );
  }
}

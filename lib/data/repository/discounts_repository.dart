import '../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/discounts_list_model.dart';

class DiscountsRepository {
  final ApiClient _apiClient;

  DiscountsRepository(this._apiClient);

  Future<Result<List<DiscountModel>>> getDiscountList() async {
    final result = await _apiClient.get<List>('/discounts/discount/list/');
    return result.fold(
          (error) => Result.error(error),
          (data) => Result.ok(data.map((e) => DiscountModel.fromJson(e)).toList()),
    );
  }
}

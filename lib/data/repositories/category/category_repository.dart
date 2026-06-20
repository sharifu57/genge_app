import 'package:genge_app/core/network/api_client.dart';
import 'package:genge_app/core/network/api_endpoints.dart';
import 'package:genge_app/data/models/category_model.dart';

class CategoryRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiClient.get(ApiEndpoints.fetchCategories);
    final List<dynamic> data = response.data['data'];
    return data.map((item) => CategoryModel.fromJson(item)).toList();
  }
}

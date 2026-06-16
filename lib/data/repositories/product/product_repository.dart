import 'package:genge_app/core/network/api_client.dart';
import 'package:genge_app/core/network/api_endpoints.dart';
import 'package:genge_app/data/models/product_model.dart';

class ProductRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<ProductModel>> getProducts() async {
    final response = await _apiClient.get(ApiEndpoints.fetchProducts);

    print("PRODUCT RESPONSE => ${response.data}");
    final List<dynamic> data = response.data['data'];
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}

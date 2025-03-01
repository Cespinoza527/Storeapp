import 'package:appstore/app/core/data/remote/dto/product_data_model.dart';
import 'package:dio/dio.dart';

final class ProductService {
  final Dio dio;
  final String _baseUrl =
      "https://storeappdamo2024-default-rtdb.firebaseio.com";

  ProductService({required this.dio});

  Future<List<ProductDataModel>> getAll() async {
    final List<ProductDataModel> products = [];

    try {
      final Response<Map> response = await dio.get("$_baseUrl/productos.json");

      if (response.data != null) {
        response.data?.forEach((key, value) {
          products.add(ProductDataModel.fromJson(key, value));
        });
      }
    } catch (e) {
      throw Exception("Error: $e");
    }

    return products;
  }

  Future<bool> delete(String id) async {
    try {
      await dio.delete("$_baseUrl/products/$id.json");
    } catch (e) {
      throw (Exception(e));
    }
    return true;
  }
}

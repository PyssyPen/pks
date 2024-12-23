import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/note.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Tovar>> getProducts() async {
    try {
      final response = await _dio.get('http://localhost:8080/products');
      if (response.statusCode == 200) {
        List<Tovar> products = (response.data as List)
            .map((product) => Tovar.fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  void deleteProduct(int id) async {
    await _dio.delete('http://localhost:8080/products/delete/$id');
  }

  void createProduct(Tovar product) async {
    await _dio.post('http://localhost:8080/products/create', data: product.toJson());
  }

  void updateProduct(Tovar product, int id) async {
    await _dio.put('http://localhost:8080/products/update/$id', data: product.toJson());
  }

}

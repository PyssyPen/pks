import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/cart_model.dart';
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

  Future<Tovar> getProductById(int id) async {
    try {
      final response = await _dio.get('http://localhost:8080/products/$id');
      if (response.statusCode == 200) {
        return Tovar.fromJson(response.data);
      } else {
        throw Exception('Failed to load product with id $id');
      }
    } catch (e) {
      throw Exception('Error fetching product by id: $e');
    }
  }

  Future<List<Tovar>> getFavoriteProducts() async {
    try {
      final response = await _dio.get('http://localhost:8080/favorites');
      if (response.statusCode == 200) {
        List<Tovar> favorites = (response.data as List)
            .map((favorite) => Tovar.fromJson(favorite))
            .toList();
        return favorites;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  void addProductToFavorite(Tovar product) async {
    await _dio.post('http://localhost:8080/favorites/add', data: product.toJson());
  }

  void deleteProductFromFavorite(int id) async {
    await _dio.delete('http://localhost:8080/favorites/delete/$id');
  }

  Future<List<CartModel>> getCartProducts() async {
    try {
      final response = await _dio.get('http://localhost:8080/cart');
      if (response.statusCode == 200) {
        List<CartModel> cart = (response.data as List)
            .map((cartItem) => CartModel.fromJson(cartItem))
            .toList();
        return cart;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  void addProductToCart(CartModel cartItem) async {
    await _dio.post('http://localhost:8080/cart/add', data: cartItem.toJson());
  }

  void deleteProductFromCart(int id) async {
    await _dio.delete('http://localhost:8080/cart/delete/$id');
  }

  void updateCartProduct(CartModel cartItem, int id) async {
    await _dio.put('http://localhost:8080/cart/update/$id', data: cartItem.toJson());
  }

}

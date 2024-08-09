import 'package:flutter_application_1/data/base_request.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/utils/api_constans.dart';

class CartRepoApi {
  static Future<List<Product>?> getCart() async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.cartUrl,
    );

    if (response == null || response['success'] == false) return null;
    if (response['cart'] == null ||
        response['cart']['products'] == null ||
        response['cart']['products'] is! List) return null;

    return (response['cart']['products'] as List).map((e) => Product.fromJson(e)).toList();
  }

  static Future<List<Product>?> addToCart(List<Product> cartItems) async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.cartUrl,
      requestType: RequestType.POST,
      body: {
        "products":
            cartItems.map((e) => {"product_id": e.id, "quantity": e.pivot!.quantity}).toList()
      },
    );

    if (response == null || response['success'] == false) return null;
    if (response['cart'] == null ||
        response['cart']['products'] == null ||
        response['cart']['products'] is! List) return null;

    return (response['cart']['products'] as List).map((e) => Product.fromJson(e)).toList();
  }

  static Future<List<Product>?> updateCart(List<Product> cartItems) async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.cartUrl,
      requestType: RequestType.PUT,
      body: {
        "products":
            cartItems.map((e) => {"product_id": e.id, "quantity": e.pivot?.quantity}).toList()
      },
    );

    if (response == null || response['success'] == false) return null;
    if (response['cart'] == null ||
        response['cart']['products'] == null ||
        response['cart']['products'] is! List) return null;

    return (response['cart']['products'] as List).map((e) => Product.fromJson(e)).toList();
  }

  static Future<bool> deleteAllCart() async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.cartUrl,
      requestType: RequestType.DELETE,
    );

    if (response['success'] == true) return true;
    return false;
  }
}

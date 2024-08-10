import 'package:flutter_application_1/data/base_request.dart';
import 'package:flutter_application_1/data/models/order.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/utils/api_constans.dart';

class OrderRepoApi {
  static Future<List<Order>?> getAllOrders() async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.ordersUrl,
    );

    if (response == null || response['success'] == false) return null;
    if (response['orders'] == null || response['orders'] is! List) return null;

    return (response['orders'] as List).map((e) => Order.fromJson(e)).toList();
  }

  static Future<Order?> placeOrder(List<Product> cartItems) async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.ordersUrl,
      requestType: RequestType.POST,
      body: {
        "products":
            cartItems.map((e) => {"product_id": e.id, "quantity": e.pivot!.quantity}).toList()
      },
    );

    if (response == null || response['success'] == false || response['order'] == null) return null;
    return Order.fromJson(response['order']);
  }
}

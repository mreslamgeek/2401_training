import 'package:flutter_application_1/data/base_request.dart';
import 'package:flutter_application_1/data/models/category.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/utils/api_constans.dart';

class CategoriesRepoApi {
  static Future<List<Category>?> getAllCategories() async {
    final response = await BaseRequest.dynamicRequest(
      path: ApiConstants.categoriesUrl,
    );

    if (response == null || response['categories'] == null || response['categories'] is! List) {
      return null;
    }

    return (response['categories'] as List).map((e) => Category.fromJson(e)).toList();
  }

  static Future<List<Product>?> getCategoryProducts(int id) async {
    final response = await BaseRequest.dynamicRequest(
      path: '${ApiConstants.categoriesUrl}/$id/products',
    );

    if (response == null || response['products'] == null || response['products'] is! List) {
      return null;
    }

    return (response['products'] as List).map((e) => Product.fromJson(e)).toList();
  }
}

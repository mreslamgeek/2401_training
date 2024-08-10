import 'package:flutter_application_1/data/models/product.dart';

class Order {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Product?>? products;

  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.products,
  });
  Order.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');

    if (json['created_at'] != null) {
      createdAt = DateTime.parse(json['created_at']!);
    }
    if (json['updated_at'] != null) {
      updatedAt = DateTime.parse(json['updated_at']!);
    }
    if (json['products'] != null && (json['products'] is List)) {
      final v = json['products'];
      final arr0 = <Product>[];
      v.forEach((v) {
        arr0.add(Product.fromJson(v));
      });
      products = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    if (products != null) {
      final v = products;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['products'] = arr0;
    }
    return data;
  }
}

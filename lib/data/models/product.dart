///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class Pivot {
/*
{
  "cart_id": 9,
  "product_id": 2,
  "quantity": 6
}
*/

  int? cartId;
  int? productId;
  int? quantity;

  Pivot({
    this.cartId,
    this.productId,
    this.quantity,
  });
  Pivot.fromJson(Map<String, dynamic> json) {
    cartId = int.tryParse(json['cart_id']?.toString() ?? '');
    productId = int.tryParse(json['product_id']?.toString() ?? '');
    quantity = int.tryParse(json['quantity']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}

class Product {
/*
{
  "id": 2,
  "name": "Product 2 in Category 1",
  "image": "https://via.placeholder.com/640x480.png/0077bb?text=voluptatum",
  "description": "Description of Product 2 in Category 1",
  "price": "71.00",
  "category_id": 1,
  "created_at": "2024-03-16T14:09:26.000000Z",
  "updated_at": "2024-03-16T14:09:26.000000Z",
  "pivot": {
    "cart_id": 9,
    "product_id": 2,
    "quantity": 6
  }
}
*/

  int? id;
  String? name;
  String? image;
  String? description;
  double? price;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Product({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });
  Product.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    name = json['name']?.toString();
    image = json['image']?.toString();
    description = json['description']?.toString();
    if (json['price'] != null) {
      price = double.parse(json['price']);
    }
    categoryId = int.tryParse(json['category_id']?.toString() ?? '');
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    pivot =
        (json['pivot'] != null && (json['pivot'] is Map)) ? Pivot.fromJson(json['pivot']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

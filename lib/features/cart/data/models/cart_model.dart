import 'package:crafty_bay/features/product/presentation/models/product_list_model.dart';

class CartModel {
  final String id;
  final ProductListModel productModel;
   int quantity;
  final String? color;
  final String? size;

  CartModel({
    required this.id,
    required this.productModel,
    required this.quantity,
    required this.color,
    required this.size,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'] ?? '',
      productModel: ProductListModel.fromJson(json['product']),
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
    );
  }
}

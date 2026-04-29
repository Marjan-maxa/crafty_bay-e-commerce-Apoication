class AddToCartParams {
  final String productId;
  final String color;
  final String size;
  final int quantity;

  AddToCartParams({
    required this.productId,
    required this.color,
    required this.size,
    required this.quantity,
  });

  factory AddToCartParams.fromJson(Map<String, dynamic> json) {
    return AddToCartParams(
      productId: json['product'] ?? '',
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product": productId,
      "color": color,
      "size": size,
      "quantity": quantity,
    };
  }
}

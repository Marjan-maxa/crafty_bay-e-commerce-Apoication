class ProductDetailsModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final int currentPrice;
  final int quantity;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.currentPrice,
    required this.quantity,
  });
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> parseList(dynamic value) {
      if (value is List) {
        return List<String>.from(value);
      }
      if (value is String && value.isNotEmpty) {
        return value.split(',').map((e) => e.trim()).toList();
      }
      return [];
    }

    return ProductDetailsModel(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      title: json['title']?.toString() ?? '',
      slug: json['slug']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      photos: parseList(json['photos']),
      colors: parseList(json['colors']),
      sizes: parseList(json['sizes']),
      currentPrice: int.tryParse("${json['current_price']}") ?? 0,
      quantity: int.tryParse("${json['quantity']}") ?? 0,
    );
  }
}

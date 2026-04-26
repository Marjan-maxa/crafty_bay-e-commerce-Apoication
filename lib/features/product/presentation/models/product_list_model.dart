class ProductListModel {
  final String id;
  final String title;
  final List<String> images;
  final String rating;
  final int currentPrice;

  ProductListModel({
    required this.id,
    required this.title,
    required this.images,
    required this.rating,
    required this.currentPrice,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['_id'].toString() ?? '',
      title: json['title'].toString() ?? 'no title',
      images: List.from(json['photos']),
      rating: json['rating']?.toString() ?? '4.5',
      currentPrice: int.tryParse("${json['current_price']}")??0,
    );
  }
}

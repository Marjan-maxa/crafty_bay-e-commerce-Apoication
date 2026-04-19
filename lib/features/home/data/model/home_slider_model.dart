class HomeSliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String? product;
  final String? brand;
  final String? category;

  HomeSliderModel(
    this.id,
    this.photoUrl,
    this.description,
    this.product,
    this.brand,
    this.category,
  );
  factory HomeSliderModel.fromJson(Map<String, dynamic> json) {
    return HomeSliderModel(
      json['id']??'',
      json['photo_url']??'',
      json['description']??'',
      json['product']??'',
      json['brand']??'',
      json['category']??'',
    );
  }
}

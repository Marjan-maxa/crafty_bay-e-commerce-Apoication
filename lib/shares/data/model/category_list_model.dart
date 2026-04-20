class CategoryListModel {
  final String id;
  final String title;
  final String icon;

  CategoryListModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) {
    return CategoryListModel(
      id: json['_id'],
      title: json['title'],
      icon: json['icon'],
    );
  }
}

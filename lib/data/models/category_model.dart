class CategoryModel {
  final String name;
  final String imageUrl;
  final bool active;

  CategoryModel({required this.name, required this.imageUrl, required this.active});

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(name: json['name'], imageUrl: json['imageUrl'], active: json['active']);
  }
}

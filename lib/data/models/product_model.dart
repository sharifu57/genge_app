import 'package:genge_app/data/models/category_model.dart';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final int quantity;
  final String unit;
  final String imageUrl;
  final String rowId;
  final CategoryModel category;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.discountedPrice,
    required this.quantity,
    required this.unit,
    required this.imageUrl,
    required this.category,
    required this.rowId
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discountedPrice: json['discountedPrice'],
      quantity: json['quantity'],
      unit: json['unit'],
      imageUrl: json['imageUrl'],
      rowId: json['rowId'],
      category: CategoryModel.fromJson(json['category']),
    );
  }
}

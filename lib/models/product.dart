import 'package:artistover/models/item.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String price;
  final String currency;
  final String weight;
  final String imageUrl;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.currency,
    required this.weight,
    required this.imageUrl,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      currency: json['currency'],
      weight: json['weight'],
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}

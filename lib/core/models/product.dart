import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final String longDescription; // added field (non-nullable)
  final double price;
  final String image;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.longDescription,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    // if longDescription isn't present, fall back to short description
    longDescription:
    (json['longDescription'] as String?) ?? (json['description'] as String),
    price: (json['price'] as num).toDouble(),
    image: json['image'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'longDescription': longDescription,
    'price': price,
    'image': image,
  };

  @override
  List<Object?> get props => [id, title, description, longDescription, price, image];
}

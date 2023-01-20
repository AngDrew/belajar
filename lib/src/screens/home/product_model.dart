import 'dart:convert';

class ProductApi {
  ProductApi({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductApi.fromJson(Map<String, dynamic> json) => ProductApi(
        products: (json['products'] as List<dynamic>).map(
          (dynamic element) {
            return Product.fromJson(element);
          },
        ).toList(),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );

  final List<Product>? products;
  final int total;
  final int skip;
  final int limit;
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    // required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discountPercentage: json['discountPercentage'],
        rating: json['rating'],
        stock: json['stock'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        // images: json['images'],
      );

  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final num rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  // final List<String> images;
}

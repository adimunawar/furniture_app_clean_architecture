import 'package:e_furniture/features/home/domain/entities/produc.dart';

class ProductModel extends Prodct {
  const ProductModel(
      {required String name,
      required String description,
      required double rating,
      required int noOfReviews,
      required int price,
      required String imgUrl,
      required String productId})
      : super(name, description, rating, noOfReviews, price, imgUrl,
            productId: productId);

  /// Returns a [ProductModel] from json
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'],
        description: json['description'],
        rating: json['rating'],
        noOfReviews: json['no_of_reviews'],
        price: json['price'],
        imgUrl: json['img_url'],
        productId: json['product_id']);
  }

  Map<String, dynamic> toJson() => {
        'product_d': productId,
        'name': name,
        'description': description,
        'price': price,
        'imageUrl': imgUrl,
        'no_of_reviews': noOfReviews,
        'rating': rating,
      };
}

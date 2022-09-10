import 'package:equatable/equatable.dart';

class Prodct extends Equatable {
  final String productId;
  final String name;
  final String description;
  final String imgUrl;
  final double rating;
  final int noOfReviews;
  final int price;
  const Prodct(this.name, this.description, this.rating, this.noOfReviews,
      this.price, this.imgUrl,
      {required this.productId});
  @override
  List<Object?> get props =>
      [productId, name, description, imgUrl, rating, noOfReviews, price];
}

import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/favorite/presentation/widgets/item_favorite.dart';
import 'package:e_furniture/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> listFavorite = [
      const ProductModel(
          name: 'Coffee Chair',
          description:
              'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
          rating: 5,
          noOfReviews: 10,
          price: 1500,
          imgUrl: 'assets/images/chair.png',
          productId: "1"),
      const ProductModel(
          name: 'Minimal Stand',
          description:
              'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
          rating: 5,
          noOfReviews: 10,
          price: 50,
          imgUrl: 'assets/images/stand.png',
          productId: "1"),
      const ProductModel(
          name: 'Black Simple Lamp',
          description:
              'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
          rating: 5,
          noOfReviews: 10,
          price: 50,
          imgUrl: 'assets/images/lamp.png',
          productId: "1"),
      const ProductModel(
          name: 'Simple Desk',
          description:
              'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
          rating: 5,
          noOfReviews: 10,
          price: 50,
          imgUrl: 'assets/images/lamp.png',
          productId: "1"),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (() {}),
          child: Image.asset(
            'assets/icons/icon_search.png',
            width: 25,
          ),
        ),
        title: Text(
          "Favorite",
          style: boldTextStyle.copyWith(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (() {}),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/icons/icon_chart.png',
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: listFavorite
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ItemFavorite(
                      product: e,
                    ),
                  ))
              .toList(),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              "Add all to my chart",
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

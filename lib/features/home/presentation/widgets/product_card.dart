import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/home/presentation/screens/detail_product_screen.dart';
import 'package:flutter/material.dart';

import '../../data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailProduct(product: product)));
      }),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(product.imgUrl), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 4),
              child: Text(
                product.name,
                style: primaryTextStyle,
              ),
            ),
            Text(
              "\$ ${product.price}",
              style: numberStyle,
            ),
          ],
        ),
      ),
    );
  }
}

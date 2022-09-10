import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/home/data/model/product_model.dart';
import 'package:e_furniture/features/home/presentation/widgets/item_circle_color.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final ProductModel product;
  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: screenSize.height * 0.55,
                    width: screenSize.width * 0.87,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50)),
                        image: DecorationImage(
                            image: AssetImage(
                              product.imgUrl,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.1,
                                  blurRadius: 0.4,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Icon(
                              Icons.chevron_left,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 192,
                        width: 64,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ItemCircleColor(
                              borderColor: Color(0xff909090),
                              itemColor: Colors.white,
                            ),
                            ItemCircleColor(
                              borderColor: Color(0xffF0F0F0),
                              itemColor: Color(0xffB4916C),
                            ),
                            ItemCircleColor(
                              borderColor: Color(0xffF0F0F0),
                              itemColor: Color(0xffE4CBAD),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    product.name,
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: medium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${product.price}",
                          style: numberStyle.copyWith(fontSize: 30),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xffE0E0E0)),
                              child: const Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "01",
                                style: numberStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xffE0E0E0)),
                              child: const Center(
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Text(
                          "4.5",
                          style: numberStyle.copyWith(fontSize: 18),
                        ),
                      ),
                      Text(
                        "(50 Review)",
                        style: primaryTextStyle.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      product.description,
                      style: primaryTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF0F0F0)),
                        child: const Center(
                          child: Icon(Icons.bookmark_outline),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          print("oke");
                        }),
                        child: Container(
                          height: 60,
                          width: screenSize.width * 0.6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: primaryTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

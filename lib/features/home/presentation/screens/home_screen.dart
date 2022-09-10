import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/home/data/data_sources/produc_dummy.dart';
import 'package:e_furniture/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import '../widgets/row_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 2.0,
            backgroundColor: Colors.white,
            leading: Image.asset(
              'assets/icons/icon_search.png',
              width: 25,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Make home",
                  style: greyTextStyle.copyWith(
                      color: Colors.grey.shade600, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "BEAUTIFUL",
                  style:
                      boldTextStyle.copyWith(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              Image.asset(
                'assets/icons/icon_chart.png',
              )
            ],
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 16, 0, 20),
            sliver: SliverToBoxAdapter(
              child: RowMenu(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisExtent: 255,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(
                    product: listProducts[index],
                  );
                },
                childCount: listProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

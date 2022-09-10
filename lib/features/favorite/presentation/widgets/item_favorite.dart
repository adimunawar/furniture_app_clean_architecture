import 'package:e_furniture/features/home/data/model/product_model.dart';
import 'package:e_furniture/modules.dart';

class ItemFavorite extends StatelessWidget {
  final ProductModel product;
  const ItemFavorite({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(product.imgUrl), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: primaryTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: numberStyle.copyWith(fontWeight: bold, fontSize: 18),
                  )
                ],
              ),
              Flexible(child: Container()),
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.cancel_outlined,
                      size: 30,
                    ),
                    Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                            color: const Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset('assets/icons/shoping_bag.png'))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            height: 3,
            indent: 2,
            thickness: 1,
          )
        ],
      ),
    );
  }
}

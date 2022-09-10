import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final Color bgColor;
  final int index;
  final int selectedIndex;
  final String imageAsset;
  final String title;
  final Function onTap;
  const ItemMenu(
      {Key? key,
      required this.selectedIndex,
      required this.imageAsset,
      required this.title,
      required this.bgColor,
      required this.onTap,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (() {
              onTap();
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(12)),
              width: 44,
              height: 44,
              child: Center(
                child: index == 0
                    ? Icon(
                        index == selectedIndex
                            ? Icons.star
                            : Icons.star_border_outlined,
                        color:
                            index == selectedIndex ? Colors.white : Colors.grey,
                      )
                    : Image.asset(
                        imageAsset,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: primaryTextStyle.copyWith(
                color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

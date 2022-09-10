import 'package:flutter/material.dart';

class ItemCircleColor extends StatelessWidget {
  final Color borderColor;
  final Color itemColor;
  const ItemCircleColor({
    Key? key,
    required this.borderColor,
    required this.itemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 4)),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(color: itemColor, shape: BoxShape.circle),
      ),
    );
  }
}

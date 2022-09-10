import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:flutter/material.dart';

class RatingStart extends StatelessWidget {
  final double rate;

  const RatingStart({Key? key, required this.rate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int numberOfStart = rate.round();
    return Row(
        children: List<Widget>.generate(
                5,
                (index) => Icon(
                      (index < numberOfStart)
                          ? Icons.star
                          : Icons.star_border_outlined,
                      size: 16,
                      color: Colors.yellow,
                    )) +
            [
              const SizedBox(
                width: 4,
              ),
              Text(
                rate.toString(),
                style: greyTextStyle,
              )
            ]);
  }
}

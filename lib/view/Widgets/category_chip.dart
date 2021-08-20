import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/restaurant_model.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    @required this.category,
    Key key,
  }) : super(key: key);

  final FCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 0.55,
          vertical: kPadding * 0.2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          gradient: getCategoryGradient(category),
        ),
        child: Center(
          child: Text(
            category.toString().split('.').last,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 10,
                  color: Colors.white,
                ),
          ),
        ));
  }
}

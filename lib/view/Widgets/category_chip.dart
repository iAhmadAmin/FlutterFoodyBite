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
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          gradient: getCategoryGradient(category),
        ),
        child: Center(
          child: Text(
            category.toString().split('.').last,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 8,
                  color: Colors.white,
                ),
          ),
        ));
  }
}

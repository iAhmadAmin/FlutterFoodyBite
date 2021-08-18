import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/category_tile.dart';
import 'package:get/get.dart';

class CategorySelectorPage extends StatelessWidget {
  const CategorySelectorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding,
          ),
          child: ListView.builder(
            itemCount: FCategory.values.length,
            itemBuilder: (_, index) {
              final _category = FCategory.values[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: kPadding,
                ),
                child: CategoryTile(
                  height: 80,
                  width: getRelativeWidth(1),
                  category: _category,
                  showDivider: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:get/get.dart';

class CategoryRestaurantsPage extends StatelessWidget {
  const CategoryRestaurantsPage({@required this.category});
  final FCategory category;

  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = getCategoryGradient(category).colors;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      // appBar: MAppBar(
      //   title: _currentCategory.toString().split('.').last,
      //   appBar: AppBar(),
      //   txtColor: Colors.white,
      //   bgColor: Colors.transparent,
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 95,
            width: getRelativeWidth(1),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 95,
                  width: getRelativeWidth(1),
                  child: Hero(
                    tag: category,
                    child: Image.asset(
                      Images.getCategoryImage(category),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 95,
                  width: getRelativeWidth(1),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      _colors.first.withOpacity(0.5),
                      _colors.last.withOpacity(0.5),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          category.toString().split('.').last,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                      ]),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: getRelativeWidth(1),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.01),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.9),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurantList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index < restaurantList.length
                    ? RestaurantTile(
                        restaurant: restaurantList[index],
                      )
                    : const SizedBox(height: defaultPadding * 2);
              },
            ),
          ),
        ],
      ),
    );
  }
}

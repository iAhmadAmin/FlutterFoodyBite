import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/no_restaurant.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:get/get.dart';

class CategoryRestaurantsPage extends StatefulWidget {
  const CategoryRestaurantsPage({@required this.category});
  final FCategory category;

  @override
  _CategoryRestaurantsPageState createState() =>
      _CategoryRestaurantsPageState();
}

class _CategoryRestaurantsPageState extends State<CategoryRestaurantsPage> {
  PageController _pageController;
  int _currentPage;
  FCategory _currentCategory;
  @override
  void initState() {
    super.initState();
    _currentCategory = widget.category;
    _currentPage = FCategory.values.indexOf(widget.category);
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = getCategoryGradient(widget.category).colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MAppBar(
        title: _currentCategory.toString().split('.').last.tr,
        appBar: AppBar(),
        txtColor: Colors.white,
        bgColor: Colors.transparent,
      ),
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
                  child: Image.asset(
                    Images.getCategoryImage(_currentCategory),
                    fit: BoxFit.cover,
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
                Positioned(
                    bottom: defaultPadding / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: FCategory.values.map((e) {
                        return Container(
                          margin: const EdgeInsets.only(right: 4),
                          height: 4,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: e == _currentCategory
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentCategory = FCategory.values[value];
                    });
                  },
                  itemCount: FCategory.values.length,
                  itemBuilder: (_, index) {
                    final _restaurants = restaurantList
                        .where(
                          (r) => r.category == FCategory.values[index],
                        )
                        .toList();
                    return _restaurants.length > 0
                        ? ListView.builder(
                            itemCount: _restaurants.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              return index < _restaurants.length
                                  ? RestaurantTile(
                                      restaurant: _restaurants[index],
                                    )
                                  : const SizedBox(height: defaultPadding * 2);
                            },
                          )
                        : const NoRestaurantTile(
                            title: 'No Restaurant found with this category.',
                            subtitle:
                                'Try searching again with other categories.',
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

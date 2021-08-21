import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';

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
                    tag: widget.category,
                    child: Image.asset(
                      Images.getCategoryImage(_currentCategory),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Text(
                          _currentCategory.toString().split('.').last,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                      ]),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentCategory = FCategory.values[value];
                });
              },
              children: FCategory.values
                  .map((c) => FilteredRestaurants(
                        category: c,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FilteredRestaurants extends StatelessWidget {
  const FilteredRestaurants({@required this.category});
  final FCategory category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurantList.length,
      itemBuilder: (BuildContext context, int index) {
        return RestaurantTile(
          restaurant: restaurantList[index],
        );
      },
    );
  }
}

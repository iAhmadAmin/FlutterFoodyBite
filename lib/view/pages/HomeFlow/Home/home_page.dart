import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/HomeFlow/Category/category_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Trending/trending_restaurants_page.dart';
import 'package:foodybite/view/widgets/category_tile.dart';
import 'package:foodybite/view/widgets/heading_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:foodybite/view/widgets/search_field.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: kPadding * 1.5,
              ),
              const SearchField(),
              const SizedBox(
                height: kPadding * 1.5,
              ),
              HeadinBar(
                label: 'Trending Restaurants',
                count: '29',
                onTap: () {
                  Get.to(() => const TrendingRestarurantsPage());
                },
              ),
              SizedBox(
                height: getRelativeWidth(0.7),
                width: getRelativeWidth(1),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurantList.length + 1,
                    itemBuilder: (_, index) {
                      return index < restaurantList.length
                          ? SizedBox(
                              width: getRelativeWidth(0.9),
                              child: RestaurantTile(
                                restaurant: restaurantList[index],
                                margin: const EdgeInsets.only(
                                  left: kPadding,
                                  bottom: 3,
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: kPadding,
                            );
                    }),
              ),
              const SizedBox(
                height: kPadding * 1.5,
              ),
              HeadinBar(
                label: 'Categories',
                count: '9',
                onTap: () {
                  Get.to(
                    () => CategorySelectorPage(),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryTile(
                      category: FCategory.Italian,
                    ),
                    CategoryTile(
                      category: FCategory.Chinese,
                    ),
                    CategoryTile(
                      category: FCategory.Thai,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding * 1.5,
              ),
              HeadinBar(
                label: 'Friends',
                count: '56',
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: AssetImage(Images.food),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: AssetImage(Images.food),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: AssetImage(Images.food),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: AssetImage(Images.food),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: AssetImage(Images.food),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: kPadding * 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

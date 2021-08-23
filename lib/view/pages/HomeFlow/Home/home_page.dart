import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/HomeFlow/Category/category_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Filter/filter_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Trending/trending_restaurants_page.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/UserListing/user_listing_page.dart';
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
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getRelativeHeight(0.04),
              ),
              SearchField(
                controller: _searchController,
                hint: Values.find_restaurants.tr,
                onLeadingTap: () {
                  Get.to(() => FilterPage());
                },
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              HeadinBar(
                label: Values.trending_restaurants.tr,
                count: '29',
                onTap: () {
                  Get.to(() => const TrendingRestarurantsPage());
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              SizedBox(
                height: getRelativeWidth(0.62),
                width: getRelativeWidth(1),
                child: CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 0.91,
                      reverse: true,
                      height: getRelativeWidth(0.62),
                    ),
                    itemCount: restaurantList.length,
                    itemBuilder: (_, index, __) {
                      return SizedBox(
                        width: getRelativeWidth(0.9),
                        child: RestaurantTile(
                          restaurant: restaurantList[index],
                          margin: const EdgeInsets.only(
                            right: defaultPadding,
                            bottom: 3,
                          ),
                        ),
                      );
                    }),
              ),
              // SizedBox(
              //   height: getRelativeWidth(0.62),
              //   width: getRelativeWidth(1),
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: restaurantList.length + 1,
              //
              //       itemBuilder: (_, index) {
              //         return index < restaurantList.length
              //             ? SizedBox(
              //                 width: getRelativeWidth(0.9),
              //                 child: RestaurantTile(
              //                   restaurant: restaurantList[index],
              //                   margin: const EdgeInsets.only(
              //                     left: defaultPadding,
              //                     bottom: 3,
              //                   ),
              //                 ),
              //               )
              //             : const SizedBox(
              //                 width: defaultPadding,
              //               );
              //       }),
              // ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              HeadinBar(
                label: Values.categories.tr,
                count: '9',
                onTap: () {
                  Get.to(
                    () => const CategorySelectorPage(),
                  );
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryTile(
                      category: FCategory.italian,
                    ),
                    CategoryTile(
                      category: FCategory.chinese,
                    ),
                    CategoryTile(
                      category: FCategory.thai,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              HeadinBar(
                label: Values.friends.tr,
                count: '56',
                onTap: () {
                  Get.to(
                    () => UserListingPage(
                        isFollowing: true,
                        appBarTitle: Values.following.tr,
                        userList: userList),
                  );
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: const AssetImage(Images.d1),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: const AssetImage(Images.d2),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: const AssetImage(Images.d3),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: const AssetImage(Images.d4),
                    ),
                    CircleAvatar(
                      radius: getRelativeWidth(0.08),
                      backgroundImage: const AssetImage(Images.d5),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getRelativeHeight(0.12),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

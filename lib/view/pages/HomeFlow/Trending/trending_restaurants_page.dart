import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/view/pages/HomeFlow/Filter/filter_page.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:foodybite/view/widgets/search_field.dart';
import 'package:get/get.dart';

class TrendingRestarurantsPage extends StatefulWidget {
  const TrendingRestarurantsPage({Key key}) : super(key: key);

  @override
  _TrendingRestarurantsPageState createState() =>
      _TrendingRestarurantsPageState();
}

class _TrendingRestarurantsPageState extends State<TrendingRestarurantsPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Values.trending_restaurants.tr,
        appBar: AppBar(),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            const SizedBox(height: defaultPadding / 2),
            SearchField(
              controller: _searchController,
              onLeadingTap: () {
                Get.to(() => FilterPage());
              },
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
      ),
    );
  }
}

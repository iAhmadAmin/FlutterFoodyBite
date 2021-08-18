import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/view/pages/HomeFlow/Filter/filter_page.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:foodybite/view/widgets/search_field.dart';
import 'package:get/get.dart';

class TrendingRestarurantsPage extends StatelessWidget {
  const TrendingRestarurantsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: 'Trending Restaurants',
        appBar: AppBar(),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            SearchField(
              onLeadingTap: () {
                Get.to(() => FilterPage());
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (BuildContext context, int index) {
                  return RestaurantTile(
                    restaurant: restaurantList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

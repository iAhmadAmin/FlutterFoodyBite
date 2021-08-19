import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';

class FavouriteRestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          title: 'My Favourite',
          appBar: AppBar(),
        ),
        body: SizedBox.expand(
          child: ListView.builder(
            itemCount: restaurantList.length + 1,
            itemBuilder: (_, index) => index < restaurantList.length
                ? RestaurantTile(
                    restaurant: restaurantList[index],
                    forFavourite: true,
                  )
                : const SizedBox(height: kPadding * 4),
          ),
        ));
  }
}

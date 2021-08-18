import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: 'Profile',
        appBar: AppBar(),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const SizedBox(height: kPadding),
              CircleAvatar(
                radius: getRelativeWidth(0.16),
                backgroundImage: AssetImage(Images.d1),
              ),
              const SizedBox(height: kPadding),
              Text(
                'Jayson Acevedo',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: kPadding / 4),
              Text(
                'jayson.acevedo@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: kSecondaryTextColor),
              ),
              const SizedBox(height: kPadding * 1.5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CountTile(
                  label: 'Reviews',
                  count: 120,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getRelativeWidth(0.07),
                  ),
                  height: 30,
                  width: 0.5,
                  color: kSecondaryTextColor,
                ),
                CountTile(
                  label: 'Followers',
                  count: 240,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getRelativeWidth(0.07),
                  ),
                  height: 30,
                  width: 0.5,
                  color: kSecondaryTextColor,
                ),
                CountTile(
                  label: 'Following',
                  count: 74,
                )
              ]),
              const SizedBox(height: kPadding * 1.5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MButton(
                  label: 'Follow',
                  onTap: () {},
                  width: getRelativeWidth(0.35),
                  height: 50,
                ),
                const SizedBox(width: kPadding),
                MButton(
                  isFilled: false,
                  label: 'Block',
                  onTap: () {},
                  width: getRelativeWidth(0.35),
                  height: 50,
                ),
              ]),
              const SizedBox(height: kPadding),
              const Divider(
                height: kPadding,
                color: kSecondaryColor,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, index) =>
                    RestaurantTile(restaurant: restaurantList[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountTile extends StatelessWidget {
  const CountTile({
    @required this.count,
    @required this.label,
  });

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        count.toString(),
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      const SizedBox(height: kPadding / 3),
      Text(label,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: kSecondaryTextColor,
                fontWeight: FontWeight.w600,
              )),
    ]);
  }
}

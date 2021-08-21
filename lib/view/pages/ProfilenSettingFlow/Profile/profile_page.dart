import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/dialogs/m_dialogs.dart';
import 'package:foodybite/view/pages/HomeFlow/Reviews/review_rating_page.dart';
import 'package:foodybite/view/pages/NewReview/new_review_page.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/EditProfile/edit_profile_page.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/UserListing/user_listing_page.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/settings/settings_page.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({@required this.isMe});

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: isMe ? 'My Profile' : 'Profile',
        appBar: AppBar(),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const SizedBox(height: defaultPadding),
              CircleAvatar(
                radius: getRelativeWidth(0.15),
                backgroundImage: const AssetImage(Images.d1),
              ),
              const SizedBox(height: defaultPadding),
              Text(
                'Jayson Acevedo',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: defaultPadding / 4),
              Text(
                'jayson.acevedo@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: ktextColor),
              ),
              const SizedBox(height: defaultPadding * 1.5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CountTile(
                  label: 'Reviews',
                  count: 120,
                  onTap: () {
                    Get.to(() => const ReviewRatingPage(showMyRatings: true));
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getRelativeWidth(0.07),
                  ),
                  height: 30,
                  width: 0.5,
                  color: ktextColor,
                ),
                CountTile(
                    label: 'Followers',
                    count: 240,
                    onTap: () {
                      Get.to(() => UserListingPage(
                            appBarTitle: 'Followers',
                            userList: userList,
                          ));
                    }),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getRelativeWidth(0.07),
                  ),
                  height: 30,
                  width: 0.5,
                  color: ktextColor,
                ),
                CountTile(
                    label: 'Following',
                    count: 74,
                    onTap: () {
                      Get.to(() => UserListingPage(
                            appBarTitle: 'Following',
                            userList: userList,
                            isFollowing: true,
                          ));
                    })
              ]),
              const SizedBox(height: defaultPadding * 1.5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MButton(
                  label: isMe ? 'Edit Profile' : 'Follow',
                  onTap: isMe
                      ? () {
                          Get.to(
                            () => EditPofilePage(),
                          );
                        }
                      : () {},
                  width: getRelativeWidth(0.35),
                  height: 45,
                ),
                const SizedBox(width: defaultPadding),
                MButton(
                  isFilled: false,
                  label: isMe ? 'Settings' : 'Block',
                  onTap: isMe
                      ? () {
                          Get.to(() => SettingsPage());
                        }
                      : () {},
                  width: getRelativeWidth(0.35),
                  height: 45,
                ),
              ]),
              const SizedBox(height: defaultPadding),
              const Divider(
                height: defaultPadding,
                color: secondaryColor,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (_, index) => RestaurantTile(
                  forProfile: true,
                  restaurant: restaurantList[index],
                  menuTap: () {
                    MDialogs.menuDialog(
                      onDeleteTap: () {
                        Get.back();
                        MDialogs.confirmationDialog(
                          title: 'Are you sure you want to delete this post?',
                          onYesTap: () {},
                          onNoTap: () {
                            Get.back();
                          },
                        );
                      },
                      onEditTap: () {
                        Get.back();
                        Get.to(() => const NewReviewPage(
                              isUpdate: true,
                            ));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: defaultPadding * 8),
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
    @required this.onTap,
  });

  final String label;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: defaultPadding / 3),
        Text(label,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: ktextColor,
                  fontWeight: FontWeight.w600,
                )),
      ]),
    );
  }
}

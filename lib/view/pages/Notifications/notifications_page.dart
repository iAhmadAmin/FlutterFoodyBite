import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/notification_model.dart';
import 'package:foodybite/utils/datetime_utils.dart';
import 'package:foodybite/view/widgets/app_bar.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        appBar: AppBar(),
        title: 'Notifications',
      ),
      body: SizedBox.expand(
          child: ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (_, index) =>
            NotificationTile(notification: notificationList[index]),
      )),
    );
  }
}

class NotificationTile extends StatelessWidget {
  NotificationTile({@required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding),
      padding: const EdgeInsets.only(bottom: kPadding),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(notification.iconPath),
          ),
          const SizedBox(
            width: kPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.source,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: kTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      DateTimeUtils.dateToString(notification.dateTime),
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: kSecondaryTextColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kPadding / 2,
                ),
                Text(
                  notification.description,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kSecondaryTextColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

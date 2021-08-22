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
        itemCount: notificationList.length + 1,
        itemBuilder: (_, index) => index < notificationList.length
            ? NotificationTile(notification: notificationList[index])
            : const SizedBox(
                height: 100,
              ),
      )),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({@required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: const EdgeInsets.only(
        bottom: defaultPadding / 2,
        top: defaultPadding,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(notification.iconPath),
          ),
          const SizedBox(
            width: defaultPadding,
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
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      DateTimeUtils.dateToString(notification.dateTime),
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: secondaryTextColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Text(
                  notification.description,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: secondaryTextColor,
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

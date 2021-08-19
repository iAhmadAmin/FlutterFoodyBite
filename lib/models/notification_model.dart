import 'package:flutter/foundation.dart';

class NotificationModel {
  NotificationModel({
    @required this.iconPath,
    @required this.source,
    @required this.description,
    @required this.dateTime,
  });

  final String iconPath, source, description;
  final DateTime dateTime;
}

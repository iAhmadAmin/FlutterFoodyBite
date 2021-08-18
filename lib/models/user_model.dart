import 'package:flutter/foundation.dart';
import 'package:foodybite/models/review_model.dart';

class UserModel {
  UserModel(
      {@required this.reviews, @required this.name, @required this.imgPath});

  String name, imgPath;
  List<Review> reviews;
}

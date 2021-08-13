import 'package:flutter/cupertino.dart';

class Restaurant {
  Restaurant({
    @required this.address,
    @required this.category,
    @required this.imagePath,
    @required this.isOpen,
    @required this.name,
    @required this.rating,
  });

  String name, address, imagePath, category;
  double rating;
  bool isOpen;
}

import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/restaurant_model.dart';

List<Restaurant> restaurantList = [
  Restaurant(
    imagePath: Images.food,
    name: 'Happy Bones',
    rating: 4.5,
    address: '394 Broome St, New York, NY 10013, USA',
    isOpen: true,
    category: 'Italian',
  ),
  Restaurant(
    imagePath: Images.food,
    name: 'Uncle Boons',
    rating: 4.3,
    address: '7 Spring St, New York, NY 10012, USA',
    isOpen: true,
    category: 'Chinese',
  ),
];

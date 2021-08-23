import 'package:foodybite/models/restaurant_model.dart';

class Images {
  static const splash = 'assets/images/splash.jpg';
  static const login = 'assets/images/login.jpg';
  static const register = 'assets/images/register.jpg';
  static const welcome = 'assets/images/welcome.jpg';
  static const food = 'assets/images/food.jpg';

  static const american = 'assets/images/american.jpg';
  static const arabian = 'assets/images/arabian.jpg';
  static const chinese = 'assets/images/chinese.jpg';
  static const indian = 'assets/images/indian.jpg';
  static const italian = 'assets/images/italian.jpg';
  static const korean = 'assets/images/korean.jpg';
  static const maxican = 'assets/images/maxican.jpg';
  static const thai = 'assets/images/thai.jpg';

  static const f1 = 'assets/images/f (1).jpg';
  static const f2 = 'assets/images/f (2).jpg';
  static const f3 = 'assets/images/f (3).jpg';
  static const f4 = 'assets/images/f (4).jpg';
  static const f5 = 'assets/images/f (5).jpg';
  static const f6 = 'assets/images/f (6).jpg';
  static const f7 = 'assets/images/f (7).jpg';
  static const f8 = 'assets/images/f (8).jpg';
  static const f9 = 'assets/images/f (9).jpg';
  static const f10 = 'assets/images/f (10).jpg';
  static const f11 = 'assets/images/f (11).jpg';
  static const f12 = 'assets/images/f (12).jpg';
  static const f13 = 'assets/images/f (13).jpg';
  static const f14 = 'assets/images/f (14).jpg';

  static const d1 = 'assets/images/dp (1).jpg';
  static const d2 = 'assets/images/dp (2).jpg';
  static const d3 = 'assets/images/dp (3).jpg';
  static const d4 = 'assets/images/dp (4).jpg';
  static const d6 = 'assets/images/dp (6).jpg';
  static const d5 = 'assets/images/dp (5).jpg';
  static const d7 = 'assets/images/dp (7).jpg';
  static const d8 = 'assets/images/dp (8).jpg';
  static const d9 = 'assets/images/dp (9).jpg';
  static const d10 = 'assets/images/dp (10).jpg';
  static const d11 = 'assets/images/dp (11).jpg';

  static String getCategoryImage(FCategory category) {
    switch (category) {
      case FCategory.american:
        return american;
      case FCategory.arabian:
        return arabian;
      case FCategory.chinese:
        return chinese;
      case FCategory.indian:
        return indian;
      case FCategory.italian:
        return italian;
      case FCategory.korean:
        return korean;
      case FCategory.mexican:
        return maxican;
      case FCategory.thai:
        return thai;
      default:
        return italian;
    }
  }
}

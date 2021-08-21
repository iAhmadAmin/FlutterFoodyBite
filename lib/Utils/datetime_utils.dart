import 'package:intl/intl.dart';

class DateTimeUtils {
  static String dateToString(DateTime date) {
    final diff = calculateDateDifference(date);
    if (diff == -1) return "Yesterday";
    if (diff == 0) return "Today";
    if (diff == 1) {
      return "Tomorrow";
    } else {
      return DateFormat.EEEE().format(date);
    }
  }

  static int calculateDateDifference(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static int calculateAverage(List<int> nums) {
    final avg = nums.reduce((num a, num b) => a + b) / nums.length;
    return avg.toInt();
  }
}

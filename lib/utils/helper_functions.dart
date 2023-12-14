import 'package:intl/intl.dart';

class HelperFunctions {
  static String getGreeting() {
    String message;
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);
    if (hour >= 5 && hour < 12) {
      message = 'Good Morning';
    } else if (hour >= 12 && hour <= 17) {
      message = 'Good Afternoon';
    } else {
      message = 'Good Evening';
    }
    return message;
  }
}

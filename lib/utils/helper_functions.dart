import 'package:intl/intl.dart';

class HelperFunctions {
  static String getGreeting() {
    String message;
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);
    if (hour >= 5 && hour < 12) {
      message = 'ಶುಭೋದಯ';
    } else if (hour >= 12 && hour <= 17) {
      message = 'ಶುಭ ಅಪರಾಹ್ನ';
    } else {
      message = 'ಶುಭ ಸಂಜೆ';
    }
    return message;
  }
}

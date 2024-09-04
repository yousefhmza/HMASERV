import 'package:intl/intl.dart';

import 'constants.dart';

class Utils {
  static String imagePath(String path) => "${Constants.imagesBaseUrl}/$path";

  static String formatStandardDate(String date) =>
      DateFormat("dd, MMMM yyyy").format(DateFormat("yyyy-MM-dd").parse(date));

  static String formatWithSeparator(int number) {
    String numberString = number.toString();
    RegExp regExp = RegExp(r'\B(?=(\d{3})+(?!\d))');
    String formattedString = numberString.replaceAllMapped(regExp, (match) => ',');
    return formattedString;
  }

  static String formatRuntime(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    String hoursString = hours > 0 ? '$hours hr${hours > 1 ? 's' : ''} ' : '';
    String minutesString = minutes > 0 ? '$minutes min${minutes > 1 ? 's' : ''}' : '';
    return '$hoursString$minutesString'.trim();
  }
}

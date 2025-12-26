import 'package:utils/src/functions/date_functions.dart';

extension DateExtensionX on DateTime {
  DateTime get toJustDay => DateTime(year, month, day);
  bool get isCurrentDay => isSameDay(currentDay());

  bool isDayBefore(DateTime otherDay) {
    return toJustDay.isBefore(otherDay.toJustDay);
  }

  bool isDayAfter(DateTime otherDay) {
    return toJustDay.isAfter(otherDay.toJustDay);
  }

  bool isSameDay(DateTime otherDay) {
    return year == otherDay.year &&
        month == otherDay.month &&
        day == otherDay.day;
  }

  bool isThisWeekMonday() {
    final monday = getWeekMonday(this);
    return isSameDay(monday);
  }
}

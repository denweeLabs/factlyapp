import 'package:utils/utils.dart';

enum Season { winter, spring, summer, autumn }

DateTime currentDay() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime hourAndMin(int hour, int min) {
  return DateTime(1970, 1, 1, hour, min);
}

double hourMinuteToFraction(DateTime time) {
  final minuteStr = time.minute.toString().padLeft(2, '0');
  return double.parse('${time.hour}.$minuteStr');
}

DateTime getWeekMonday(DateTime date) {
  return date
      .subtract(Duration(days: date.weekday - DateTime.monday))
      .toJustDay;
}

DateTime getWeekSunday(DateTime date) {
  return date.add(Duration(days: DateTime.sunday - date.weekday)).toJustDay;
}

DateTime dayAndNowTimestamp(DateTime day) {
  final nowDate = DateTime.now();
  return DateTime(
    day.year,
    day.month,
    day.day,
    nowDate.hour,
    nowDate.minute,
  );
}

int weekIndex(DateTime from, DateTime to) {
  return to.difference(from).inDays ~/ 7;
}

int dateSelectorWeekIndex(DateTime baseDate, DateTime targetDate) {
  final monday = getWeekMonday(targetDate);
  final currentWeekIndex = weekIndex(
    baseDate.subtract(const Duration(days: 1)),
    monday,
  );
  return currentWeekIndex;
}

List<DateTime> daysInWeekIndex(DateTime baseDate, int weekIndex) {
  final baseUntil = baseDate.add(Duration(days: weekIndex * 7));
  final weekStart = getWeekMonday(baseUntil);
  return List.generate(7, (i) => weekStart.add(Duration(days: i)));
}

Season getSeason() {
  final month = currentDay().month;

  if (month == 12 || month == 1 || month == 2) {
    return Season.winter;
  } else if (month >= 3 && month <= 5) {
    return Season.spring;
  } else if (month >= 6 && month <= 8) {
    return Season.summer;
  } else {
    return Season.autumn;
  }
}

String formatTime(DateTime time) {
  return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
}

double timeToDouble(DateTime time) {
  return time.hour + time.minute / 100;
}

String hhMmToString(DateTime time) {
  final hours = time.hour.toString().padLeft(2, '0');
  final minutes = time.minute.toString().padLeft(2, '0');
  return '$hours:$minutes';
}

DateTime hhMmFromString(String time) {
  final parts = time.split(':');
  if (parts.length < 2) {
    throw FormatException('Invalid time format. Expected "HH:mm"');
  }

  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]);

  return hourAndMin(hour, minute);
}

String getDeviceTimezoneOffset() {
  final duration = DateTime.now().timeZoneOffset;
  final offset = duration.isNegative
      ? "-${(-duration.inHours).toString().padLeft(2, '0')}:${(-duration.inMinutes - (-duration.inHours * 60)).toString().padLeft(2, '0')}"
      : "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}";
  return offset;
}

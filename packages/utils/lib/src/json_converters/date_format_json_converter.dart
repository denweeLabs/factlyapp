// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

class HH_mm_jsonConverter implements JsonConverter<DateTime, String> {
  static final _format = DateFormat('HH:mm');

  const HH_mm_jsonConverter();

  @override
  DateTime fromJson(String data) {
    // Handle ISO format like '1970-01-01T09:00:00.000'
    final dateTime = DateTime.tryParse(data);
    if (dateTime != null) {
      return DateTime(1970, 1, 1, dateTime.hour, dateTime.minute);
    }

    // Handle plain 'HH:mm'
    final time = _format.parse(data);
    return DateTime(1970, 1, 1, time.hour, time.minute);
  }

  @override
  String toJson(DateTime object) {
    return _format.format(object);
  }
}

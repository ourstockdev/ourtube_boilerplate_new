import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ourtube_boilerplate/utils/date_time_utils.dart';

class DateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const DateTimeConverter();

  static final defaultFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

  DateTime? get currentDateTime =>
      defaultFormat.parse(defaultFormat.format(DateTime.now()));

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    final str = json.toString();
    return str.toLowerCase() == 'null' ? null : defaultFormat.tryParse(str);
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return defaultFormat.format(object);
  }
}

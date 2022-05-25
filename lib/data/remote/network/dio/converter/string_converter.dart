import 'package:json_annotation/json_annotation.dart';

class StringConverter implements JsonConverter<String?, Object?> {
  const StringConverter();

  @override
  String? fromJson(Object? object) {
    if (object == null) return null;
    final str = object.toString();
    return str.toLowerCase() == 'null' ? null : str;
  }

  @override
  Object? toJson(String? object) => object;
}

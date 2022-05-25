import 'package:json_annotation/json_annotation.dart';

class BoolConverter implements JsonConverter<bool?, Object?> {
  const BoolConverter();

  @override
  bool? fromJson(Object? object) {
    if (object == null) return null;
    final str = object.toString().trim().toLowerCase();
    if (str == 'true') return true;
    if (str == 'false') return false;
    return null;
  }

  @override
  Object? toJson(bool? object) => object;
}

import 'package:json_annotation/json_annotation.dart';

class DoubleConverter implements JsonConverter<double?, Object?> {
  const DoubleConverter();

  @override
  double? fromJson(Object? object) {
    if (object == null) return null;
    if (object is num) return object.toDouble();
    return double.tryParse(object.toString());
  }

  @override
  Object? toJson(double? object) => object;
}

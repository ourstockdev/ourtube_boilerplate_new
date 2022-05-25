import 'package:json_annotation/json_annotation.dart';

extension FutureHelper<T> on T? {
  Future<T> toFuture() => this == null
      ? Future.error(DisallowedNullValueException)
      : Future.value(this);
}

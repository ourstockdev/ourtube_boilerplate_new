import 'package:equatable/equatable.dart';

abstract class AppEquatableConfig {
  AppEquatableConfig._();

  static void init() {
    EquatableConfig.stringify = true;
  }
}

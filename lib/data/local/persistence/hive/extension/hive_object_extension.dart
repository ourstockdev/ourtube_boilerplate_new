import 'package:hive_flutter/adapters.dart';

extension HiveObjectExtension<T extends HiveObject> on T {
  Future<void> update(void Function(T object) action) async {
    action.call(this);
    await save();
  }
}

import 'package:hive_flutter/adapters.dart';
import 'package:ourtube_boilerplate/data/local/persistence/dao/user/document/user_document.dart';
import '../dao/config/document/config_document.dart';

class AppDatabase {
  AppDatabase._internal();

  static AppDatabase? _instance;

  static Future<AppDatabase> init() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(ConfigAdapter())
      ..registerAdapter(UserAdapter());

    return _instance ??= AppDatabase._internal();
  }

  Future<Box<UserDocument>> get userBox async => Hive.openBox('USER');
}

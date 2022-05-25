import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ko_KR.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('ko', 'KR');
  @override
  Map<String, Map<String, String>> get keys => {
    'ko_KR': ko_KR,
  };
}
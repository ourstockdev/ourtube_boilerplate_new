import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';

abstract class AppBorder {
  AppBorder._();

  static const gray200 = BorderSide(color: AppColor.gray200);
  static const gray300 = BorderSide(color: AppColor.gray200);
  static const error = BorderSide(color: AppColor.error);

  static const outlineG200 = OutlineInputBorder(borderSide: AppBorder.gray200);
  static const outlineG300 = OutlineInputBorder(borderSide: AppBorder.gray300);
  static const outlineError = OutlineInputBorder(borderSide: AppBorder.error);

  static const underlineG200 =
      UnderlineInputBorder(borderSide: AppBorder.gray200);
  static const underlineG300 =
      UnderlineInputBorder(borderSide: AppBorder.gray300);
  static const underlineError =
      UnderlineInputBorder(borderSide: AppBorder.error);
}

extension BorderSideExtension on BorderSide {
  static BorderSide get gray200 => AppBorder.gray200;

  static BorderSide get gray300 => AppBorder.gray300;

  static BorderSide get error => AppBorder.error;
}

extension OutlineExtensions on OutlineInputBorder {
  static OutlineInputBorder get gray200 => AppBorder.outlineG200;

  static OutlineInputBorder get gray300 => AppBorder.outlineG300;

  static OutlineInputBorder get error => AppBorder.outlineError;
}

extension UnderlineExtensions on UnderlineInputBorder {
  static UnderlineInputBorder get gray200 => AppBorder.underlineG200;

  static UnderlineInputBorder get gray300 => AppBorder.underlineG300;

  static UnderlineInputBorder get error => AppBorder.underlineError;
}

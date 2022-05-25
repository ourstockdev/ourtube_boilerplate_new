import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';

abstract class AppLine {
  AppLine._();

  static const horizontal1 =
      Divider(height: 1, thickness: 1, color: AppColor.gray150);
  static const horizontal2 =
      Divider(height: 2, thickness: 2, color: AppColor.gray150);

  static const horizontal8 =
      Divider(height: 8, thickness: 8, color: AppColor.gray100);

  static const vertical1 =
      VerticalDivider(width: 1, thickness: 1, color: AppColor.gray150);
  static const vertical2 =
      VerticalDivider(width: 2, thickness: 2, color: AppColor.gray150);
}

extension DividerExtension on Divider {
  static Divider get height1 => AppLine.horizontal1;

  static Divider get height2 => AppLine.horizontal2;
}

extension VerticalDividerExtension on VerticalDivider {
  static VerticalDivider get width1 => AppLine.vertical1;

  static VerticalDivider get width2 => AppLine.vertical2;
}

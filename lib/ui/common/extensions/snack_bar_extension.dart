import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

abstract class SnackBarHelper {
  SnackBarHelper._();
  static SnackBar message(String message, {Key? key, Duration? duration}) {
    return SnackBar(
      key: key,
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: AppColor.gray600,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: duration ?? 2.seconds,
      content: Text(
        message,
        style: AppTextStyle.title3R1418.copyWith(color: AppColor.wh),
      ),
    );
  }
}

extension SnackBarExtension on SnackBar {
  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(this);
  }
}

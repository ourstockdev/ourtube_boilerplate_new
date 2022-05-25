import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

abstract class AppLoadingConfig {
  AppLoadingConfig._();

  static void init() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..indicatorSize = 24
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = AppColor.blue300
      ..backgroundColor = AppColor.wh
      ..indicatorColor = AppColor.blue300
      ..textColor = AppColor.bk
      ..maskColor = AppColor.bk.withOpacity(0.5)
      ..userInteractions = false
      ..displayDuration = 3.seconds
      ..textPadding = AppInset.all8
      ..textStyle = AppTextStyle.body2R1424
      ..maskType = EasyLoadingMaskType.custom
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..dismissOnTap = false;
  }
}

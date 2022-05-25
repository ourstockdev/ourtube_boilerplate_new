import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/radius.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

/* 2021.11.03(수)~04(목) 변경사항 by 우수몽
 *
 * 1. Snackbar 추가
 * 2. lint 적용 - warning 제거
 * 3. AppSpace, AppRadius 적용
 * 4. rowWidth, rowHeight 제거
 */

class CommonWidget {
  static void toast(String error) async {
    showToastWidget(
      Container(
        decoration: const BoxDecoration(
          borderRadius: AppRadius.all20,
          color: AppColor.bk,
        ),
        margin: AppInset.bottom24 + AppInset.horizontal16,
        padding: AppInset.vertical12 + AppInset.horizontal20,
        child: Text(
          error,
          style: AppTextStyle.title1R1618.copyWith(color: AppColor.wh),
        ),
      ),
      context: Get.context,
      animDuration: Duration.zero,
    );
  }

  /* Snackbar 추가 (GetX에서 제공하는 것을 사용함) */
  static void snackBar(String message,
      {String? buttonTitle, VoidCallback? onPressed}) {
    if (buttonTitle != null && onPressed != null) {
      Get.showSnackbar(
        GetBar(
          backgroundGradient: AppColor.snackbarBackground,
          barBlur: 7,
          borderRadius: 12,
          margin: AppInset.all8,
          padding: AppInset.vertical6 + AppInset.left16 + AppInset.right8,
          messageText: Text(
            message,
            style: AppTextStyle.body2R1424,
            textAlign: TextAlign.start,
          ),
          mainButton: TextButton(
            onPressed: onPressed,
            child: Container(
              padding: AppInset.all8,
              child: Text(
                buttonTitle,
                style:
                    AppTextStyle.title2M1418.copyWith(color: AppColor.blue300),
              ),
            ),
          ),
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        ),
      );
    } else {
      Get.showSnackbar(
        GetBar(
          backgroundGradient: AppColor.snackbarBackground,
          barBlur: 7,
          borderRadius: 12,
          margin: AppInset.all8,
          padding: AppInset.vertical6 + AppInset.left16 + AppInset.right8,
          messageText: Text(
            message,
            style: AppTextStyle.body2R1424,
            textAlign: TextAlign.start,
          ),
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        ),
      );
    }
  }
}

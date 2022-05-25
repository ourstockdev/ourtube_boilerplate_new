import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/radius.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/space.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';
import 'package:ourtube_boilerplate/ui/common/components/buttons/app_button.dart';

/* 2021.11.04(목)~05(금) 변경사항 by 우수몽
 *
 * 1. common-components 밑으로 옮기고 이름 변경.
 * 2. factory 패턴 적용 (Dialog 다 합치기)
 * 3. AppButton 적용
 * 4. AppRadius, AppSpace 적용
 */

class AppDialog extends Dialog {
  AppDialog({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.all8,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: AppInset.all16,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: AppRadius.all8,
              color: AppColor.wh,
            ),
            padding: AppInset.all16,
            child: child,
          ),
        );

  /* 취소/확인 버튼 있는 Alert Dialog */
  factory AppDialog.alertTwoButton({
    Key? key,
    required String text,
    String? confirmText,
    required VoidCallback confirm,
    String? cancelText,
    VoidCallback? cancel,
  }) =>
      AppDialog.alert(
        key: key,
        text: text,
        buttons: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _TextButton(
              title: cancelText ?? '취소',
              onPressed: cancel ?? Get.back,
              titleColor: AppColor.bk,
            ),
            _TextButton(
              title: confirmText ?? '확인',
              onPressed: confirm,
              titleColor: AppColor.blue300,
            ),
          ],
        ),
      );

  /* 확인 버튼만 있는 Alert Dialog */
  factory AppDialog.alertOneButton({
    Key? key,
    required String text,
    String? confirmText,
    required VoidCallback confirm,
  }) =>
      AppDialog.alert(
        key: key,
        text: text,
        buttons: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _TextButton(
              title: confirmText ?? '확인',
              onPressed: confirm,
              titleColor: AppColor.blue300,
            ),
          ],
        ),
      );

  /* 버튼 한 개짜리 Popup Dialog */
  factory AppDialog.popupOneButton({
    Key? key,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) =>
      AppDialog(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.title0M1622,
                  textAlign: TextAlign.start,
                ),
                InkWell(
                  onTap: Get.back,
                  child: SvgPicture.asset(
                    'assets/icons/close_gr.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            AppSpace.size20,
            Text(
              message,
              style: AppTextStyle.body2R1424,
              textAlign: TextAlign.start,
            ),
            AppSpace.size20,
            AppButton.roundBlue300(
              onPressed: onPressed ?? Get.back,
              text: buttonText ?? '확인',
            ),
          ],
        ),
      );

  /* 버튼 두 개짜리 Popup Dialog */
  factory AppDialog.popupTwoButton({
    Key? key,
    required String text,
    String? confirmText,
    required VoidCallback confirm,
    String? cancelText,
    VoidCallback? cancel,
  }) =>
      AppDialog(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTextStyle.display1M1828,
              textAlign: TextAlign.center,
            ),
            AppSpace.size20,
            Row(
              children: [
                Expanded(
                  child: AppButton.roundGray150(
                    onPressed: cancel ?? Get.back,
                    text: cancelText ?? '취소',
                    height: 44,
                  ),
                ),
                AppSpace.size8,
                Expanded(
                  child: AppButton.roundBlue300(
                    onPressed: confirm,
                    text: confirmText ?? '확인',
                    height: 44,
                  ),
                )
              ],
            ),
          ],
        ),
      );

  /* 기본 Alert Dialog */
  factory AppDialog.alert({
    Key? key,
    required String text,
    required Widget buttons,
  }) =>
      AppDialog(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyle.body1R1626,
              textAlign: TextAlign.start,
            ),
            AppSpace.size12,
            buttons
          ],
        ),
      );
}

/* Alert Dialog에 쓰이는 Text Button */
class _TextButton extends InkWell {
  _TextButton({
    Key? key,
    required String title,
    required VoidCallback onPressed,
    required Color titleColor,
  }) : super(
          key: key,
          onTap: onPressed,
          child: Container(
            padding: AppInset.vertical4 + AppInset.horizontal8,
            child: Text(
              title,
              style: AppTextStyle.button2M1618.copyWith(color: titleColor),
            ),
          ),
        );
}

extension AppDialogExtension on AppDialog {
  void show() {
    Get.dialog(this);
  }
}

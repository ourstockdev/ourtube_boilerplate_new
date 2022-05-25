import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';
import 'package:ourtube_boilerplate/ui/common/widgets/buttons/common_outline_button.dart';
import 'package:ourtube_boilerplate/ui/common/widgets/buttons/common_round_button.dart';
import 'package:ourtube_boilerplate/ui/common/widgets/buttons/common_text_button.dart';

abstract class AppButton {
  AppButton._();

  /* 파란색 라운드 버튼 */
  static Widget roundBlue300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle,
        color: AppColor.blue300,
        textColor: AppColor.wh,
        height: height,
        width: width,
        enabled: enabled,
      );

  /* 빨간색 라운드 버튼 */
  static Widget roundRed300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle,
        color: AppColor.red300,
        textColor: AppColor.wh,
        height: height,
        width: width,
        enabled: enabled,
      );

  /* 회색 라운드 버튼 */
  static Widget roundGray150({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildRoundButton(
        key: key,
        onPressed: onPressed,
        height: height,
        width: width,
        text: text,
        textStyle: textStyle,
        textColor: AppColor.gray600,
        color: AppColor.gray150,
        enabled: enabled,
      );

  /* 파란색 테두리 버튼 */
  static Widget outlinedBlue300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildOutlinedButton(
        key: key,
        onPressed: onPressed,
        text: text,
        height: height,
        width: width,
        textStyle: textStyle,
        textColor: AppColor.blue300,
        color: AppColor.blue300,
        enabled: enabled,
      );

  /* 빨간색 테두리 버튼 */
  static Widget outlinedRed300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildOutlinedButton(
        key: key,
        onPressed: onPressed,
        text: text,
        height: height,
        width: width,
        textStyle: textStyle,
        textColor: AppColor.red300,
        color: AppColor.red300,
        enabled: enabled,
      );

  /* 회색 테두리 버튼 */
  static Widget outlinedGray200({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildOutlinedButton(
        key: key,
        onPressed: onPressed,
        text: text,
        height: height,
        width: width,
        textStyle: textStyle,
        textColor: AppColor.bk,
        color: AppColor.gray200,
        enabled: enabled,
      );

  /* 파란색 텍스트 버튼 */
  static Widget textBlue300({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      _buildTextButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle,
        height: height,
        width: width,
        color: AppColor.blue300,
        enabled: enabled,
      );

  /* 파란색 라운드 - 회색 테두리 토글 버튼 */
  static Widget toggleBlueGray({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required bool selected,
    String? inactiveText,
    String? disabledText,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      selected
          ? roundBlue300(
              key: key,
              onPressed: onPressed,
              text: enabled ? text : disabledText ?? text,
              textStyle: AppTextStyle.button3M1416,
              height: height,
              width: width,
              enabled: enabled,
            )
          : roundGray150(
              key: key,
              onPressed: onPressed,
              text: (enabled == false) ? (disabledText ?? inactiveText ?? text) : inactiveText ?? text,
              textStyle: AppTextStyle.button3M1416,
              height: height,
              width: width,
              enabled: enabled,
            );

  /* default */
  static const _disabledColor = AppColor.gray200;
  static const _disabledTextColor = AppColor.gray400;
  static const _elevation = 0.0;
  static final _textStyle = AppTextStyle.button2M1618;

  /* 라운드 버튼 */
  static Widget _buildRoundButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required Color color,
    required Color textColor,
    TextStyle? textStyle,
    double width = double.infinity,
    double height = 48.0,
    bool enabled = true,
  }) =>
      CommonRoundButton(
        key: key,
        onPressed: onPressed,
        width: width,
        height: height,
        text: text,
        textStyle: textStyle ?? _textStyle,
        elevation: _elevation,
        color: color,
        textColor: textColor,
        disabledColor: _disabledColor,
        disabledTextColor: _disabledTextColor,
        enabled: enabled,
      );

  /* 테두리 버튼 */
  static Widget _buildOutlinedButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required Color textColor,
    required Color color,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      CommonOutlineButton(
        key: key,
        onPressed: onPressed,
        text: text,
        textStyle: textStyle ?? _textStyle,
        width: width,
        height: height,
        elevation: _elevation,
        color: color,
        textColor: textColor,
        disabledColor: _disabledColor,
        disabledTextColor: _disabledTextColor,
        enabled: enabled,
      );

  /* 텍스트 버튼 */
  static Widget _buildTextButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required Color color,
    TextStyle? textStyle,
    double height = 48.0,
    double width = double.infinity,
    bool enabled = true,
  }) =>
      CommonTextButton(
        key: key,
        onPressed: onPressed,
        text: text,
        style: textStyle ?? _textStyle,
        width: width,
        height: height,
        elevation: _elevation,
        disabledColor: _disabledColor,
        color: color,
        enabled: enabled,
      );
}

import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/border.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

class AppInputDecoration extends InputDecoration {
  const AppInputDecoration({
    EdgeInsetsGeometry? contentPadding,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    String? hintText,
    TextStyle? hintStyle,
    String? helperText,
    TextStyle? helperStyle,
    String? errorText,
    TextStyle? errorStyle,
    Color? fillColor,
    bool enabled = true,
  }) : super(
          contentPadding: contentPadding,
          enabledBorder: enabledBorder,
          disabledBorder: disabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: focusedErrorBorder,
          hintText: hintText,
          hintStyle: hintStyle,
          helperText: helperText,
          helperStyle: helperStyle,
          errorText: errorText,
          errorStyle: errorStyle,
          filled: fillColor != null,
          fillColor: fillColor,
          // 이거 뭔지 모르겠음
          isDense: true,
          enabled: enabled,
        );

  factory AppInputDecoration.disabled({String? text}) => AppInputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 8.0,
        ),
        hintText: text,
        enabled: false,
        disabledBorder: AppBorder.underlineG200,
        enabledBorder: AppBorder.underlineG200,
        focusedBorder: AppBorder.underlineG200,
        errorBorder: AppBorder.underlineG200,
        focusedErrorBorder: AppBorder.underlineG200,
      );

  factory AppInputDecoration.create({
    String? hintText,
    String? errorText,
    String? successText,
    bool enabled = true,
  }) {
    return AppInputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 8.0,
      ),
      enabledBorder: AppBorder.underlineG200,
      focusedBorder: AppBorder.underlineG300,
      errorBorder: AppBorder.underlineError,
      focusedErrorBorder: AppBorder.underlineError,
      hintText: hintText,
      hintStyle: AppTextStyle.title1R1618.copyWith(color: AppColor.gray400),
      helperText: successText,
      helperStyle: AppTextStyle.title4R1216.copyWith(color: AppColor.success),
      errorText: errorText,
      // errorText가 비어 있는 경우(즉, 에러 여부만 표시하는 경우), 에러 텍스트 영역의 높이를 0으로 만들어서 에러 텍스트가 쓸데없이 공간을 차지하지 않도록 함.
      errorStyle: (errorText == '') ? const TextStyle(height: 0) : AppTextStyle.title4R1216.copyWith(color: AppColor.error),
      fillColor: enabled ? null : AppColor.gray150,
      enabled: enabled,
    );
  }
}

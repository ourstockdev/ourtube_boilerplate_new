import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/radius.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

class AppRatioTile<T> extends GestureDetector {
  AppRatioTile({
    Key? key,
    /* 라디오버튼 로직 관련 */
    required final T value,
    required final T groupValue,
    required final ValueChanged<T?> onChanged,
    /* 라디오버튼 UI 관련 */
    required final String buttonText,
    required final TextStyle textStyle,
    final EdgeInsetsGeometry? padding,
    required final double height,
    required final Color selectedColor,
    required final Color unSelectedColor,
    final BoxBorder? selectedBorder,
    final BoxBorder? unSelectedBorder,
    required final Color selectedTextColor,
    required final Color unSelectedTextColor,
    required final BorderRadius radius,
  }) : super(
    key: key,
    child: GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: padding,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (value == groupValue) ? selectedColor : unSelectedColor,
          borderRadius: radius,
          border: (value == groupValue) ? selectedBorder : unSelectedBorder,
        ),
        child: Text(buttonText,
            style: textStyle.copyWith(color: (value == groupValue) ? selectedTextColor : unSelectedTextColor),
        ),
      ),
    ),
  );

  /* 상시거래 필터에 쓰이는 라디오버튼 */
  factory AppRatioTile.normal({
    Key? key,
    /* 라디오버튼 로직 관련 */
    required final T value,
    required final T groupValue,
    required final ValueChanged<T?> onChanged,
    /* 라디오버튼 UI 관련 */
    required final String buttonText,
  }) => AppRatioTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      buttonText: buttonText,
      textStyle: AppTextStyle.title3R1418,
      padding: AppInset.horizontal12 + AppInset.vertical6,
      height: 30,
      selectedColor: AppColor.bk,
      unSelectedColor: AppColor.wh,
      unSelectedBorder: Border.all(color: AppColor.gray200),
      selectedTextColor: AppColor.wh,
      unSelectedTextColor: AppColor.gray600,
      radius: AppRadius.all20,
  );
}

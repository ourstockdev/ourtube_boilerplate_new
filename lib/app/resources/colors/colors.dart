import 'package:flutter/material.dart';

/* 2021.11.04(목) 변경사항 by 우수몽
 *
 * 1. Figma 수정사항 반영 : blue200, blue50 삭제
 */

abstract class AppColor {
  AppColor._();

  /* snackbar 배경색. */
  static LinearGradient snackbarBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gray300.withOpacity(0.6),
      gray300.withOpacity(0.2),
    ],
  );

  static const Color bk = Color(0xFF333333);
  static const Color wh = Color(0xFFFFFFFF);

  static const Color blue300 = Color(0xFF026BFB);
  static const Color blue100 = Color(0xFFF2FAFF);

  static const Color red300 = Color(0xFFFF484E);
  static const Color red100 = Color(0xFFFFF5F5);

  static const Color gray600 = Color(0xFF818181);
  static const Color gray500 = Color(0xFF9D9FA3);
  static const Color gray400 = Color(0xFFB4B4B8);
  static const Color gray300 = Color(0xFFD9D9DB);
  static const Color gray200 = Color(0xFFEFEFEF);
  static const Color gray150 = Color(0xFFF6F6F6);
  static const Color gray100 = Color(0xFFFBFBFB);

  static const Color success = Color(0xFF026BFB);
  static const Color error = Color(0xFFFF484E);

  static const Color skeleton = gray200;
}

import 'package:flutter/material.dart';

/* 2021.11.04(목) 변경사항 by 우수몽
 *
 * 1. Figma 수정사항 반영 : Title0_M1622 변경, Title5_R1012 추가, 삭제된 Style 제거 등등.
 * 2. letterSpacing 추가.
 */

abstract class AppTextStyle {
  AppTextStyle._();

  /* DISPLAY */
  static TextStyle display1M1828 = NotoSansTextStyle.medium(
    size: 18,
    fontWeight: FontWeight.w700,
    height: 28,
  );

  static TextStyle display2R2032 = NotoSansTextStyle.regular(
    size: 20,
    fontWeight: FontWeight.w700,
    height: 32,
    letterSpacing: -1,
  );

  static TextStyle display3M1824 = NotoSansTextStyle.medium(
    size: 18,
    fontWeight: FontWeight.w700,
    height: 24,
    letterSpacing: -0.5,
  );

  static TextStyle display4M2224 = NotoSansTextStyle.medium(
    size: 22,
    fontWeight: FontWeight.w700,
    height: 24,
  );

  /* TITLE */

  static TextStyle title0M1622 = NotoSansTextStyle.medium(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 22,
  );

  static TextStyle title1R1618 = NotoSansTextStyle.regular(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle title2M1418 = NotoSansTextStyle.medium(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle title3R1418 = NotoSansTextStyle.regular(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle title4R1216 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 16,
  );

  static TextStyle title5R1012 = NotoSansTextStyle.regular(
    size: 10,
    fontWeight: FontWeight.w400,
    height: 12,
  );

  /* BODY */

  static TextStyle body1R1626 = NotoSansTextStyle.regular(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 26,
  );

  static TextStyle body2R1424 = NotoSansTextStyle.regular(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 24,
  );

  static TextStyle body3R1220 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 20,
  );

  /* BUTTON */

  static TextStyle button1B1618 = NotoSansTextStyle.bold(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle button2M1618 = NotoSansTextStyle.medium(
    size: 16,
    fontWeight: FontWeight.w400,
    height: 18,
  );

  static TextStyle button3M1416 = NotoSansTextStyle.medium(
    size: 14,
    fontWeight: FontWeight.w400,
    height: 16,
  );

  static TextStyle button4R1214 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 14,
  );

  /* CAPTION */

  static TextStyle captionR1218 = NotoSansTextStyle.regular(
    size: 12,
    fontWeight: FontWeight.w400,
    height: 18,
  );
}

@immutable
class NotoSansTextStyle extends TextStyle {
  static const notoSansRegular = 'noto_sans_regular';
  static const notoSansMedium = 'noto_sans_medium';
  static const notoSansBold = 'noto_sans_bold';

  const NotoSansTextStyle(
    String fontFamily,
    Color color,
    double size,
    FontWeight fontWeight,
    double height,
    double? letterSpacing,
  ) : super(
          fontFamily: fontFamily,
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          height: height / size,
          letterSpacing: letterSpacing,
        );

  factory NotoSansTextStyle.regular({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      NotoSansTextStyle(
          notoSansRegular, color, size, fontWeight, height, letterSpacing);

  factory NotoSansTextStyle.medium({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      NotoSansTextStyle(
          notoSansMedium, color, size, fontWeight, height, letterSpacing);

  factory NotoSansTextStyle.bold({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      NotoSansTextStyle(
          notoSansBold, color, size, fontWeight, height, letterSpacing);
}

//
// import 'package:flutter/material.dart';
//
//
// class FontName {
//
//   static const notoSansRegular = "NotoSans-Regular";
//   static const notoSansMedium = "NotoSans-Medium";
//   static const notoSansBold = "NotoSans-Bold";
//
// }
//
//
//
//
// class AppTextStyle {
//
//   static  TextStyle _notoSansRegular(Color color, double size, FontWeight fontWeight,double height) {
//     return _textStyle(FontName.notoSansRegular, color, size, fontWeight, height);
//   }
//
//   static TextStyle _notoSansMedium(Color color, double size, FontWeight fontWeight,double height) {
//     return _textStyle(FontName.notoSansMedium, color, size, fontWeight, height);
//   }
//
//   static TextStyle _notoSansBold(Color color, double size, FontWeight fontWeight,double height) {
//     return _textStyle(FontName.notoSansBold, color, size, fontWeight,height);
//   }
//
//
//
//   /*
//   Display
//    */
//
//   static  TextStyle DISPLAY1_M1828(Color color) =>
//       _notoSansMedium(color, 18, FontWeight.w700,0);
//
//   static TextStyle DISPLAY3_M1824(Color color) =>
//       _notoSansMedium(color, 18, FontWeight.w700,0);
//
//   static TextStyle DISPLAY2_R2032( Color color) =>
//       _notoSansRegular(color, 20, FontWeight.w400,0);
//
//
//   /*
//   TItle
//    */
//
//   static TextStyle TITLE0_M1618 = ({required Color color}) =>
//       _notoSansMedium(color, 16, FontWeight.w700,0);
//
//   static TextStyle TITLE1_R1618 = ({required Color color}) =>
//       _notoSansRegular(color, 16, FontWeight.w400,0);
//
//   static TextStyle TITLE2_M1418 = ({required Color color}) =>
//       _notoSansMedium(color, 14, FontWeight.w400,0);
//
//
//   static Function TITLE3_R1418 = ({required Color color}) =>
//       _notoSansRegular(color, 14, FontWeight.w400,0);
//
//
//   static Function TITLE4_R1216 = ({required Color color}) =>
//       _notoSansRegular(color, 12, FontWeight.w400,0);
//
//
//   /*
//     Body
//    */
//
//   static Function BODY1_R1626 = ({required Color color}) =>
//       _notoSansRegular(color, 16, FontWeight.w400,0);
//
//   static Function BODY2_R1424 = ({required Color color}) =>
//       _notoSansRegular(color, 14, FontWeight.w400,0);
//
//   static Function BODY3_R1220 = ({required Color color}) =>
//       _notoSansRegular(color, 12, FontWeight.w400,0);
//
//
//
//
//   /*
//     Button
//    */
//
//   static Function BUTTON1_B1618 = ({required Color color}) =>
//       _notoSansBold(color, 16, FontWeight.w400,0);
//
//   static Function BUTTON2_M1618 = ({required Color color}) =>
//       _notoSansMedium(color, 16, FontWeight.w400,0);
//
//   static Function BUTTON3_M1416 = ({required Color color}) =>
//       _notoSansRegular(color, 14, FontWeight.w400,0);
//
//   static Function BUTTON4_R1214 = ({required Color color}) =>
//       _notoSansRegular(color, 12, FontWeight.w400,0);
//
//   /*
//     Caption
//    */
//
//   static Function CAPTION_R1218 = ({required Color color}) =>
//       _notoSansRegular(color, 12, FontWeight.w400,0);
//
//   /*
//     Overline
//    */
//
//   static Function OVERLINE_L1016 = ({required Color color}) =>
//       _notoSansRegular(color, 10, FontWeight.w400,0);
//
//
// }
//
//
// TextStyle _textStyle(
//     String fontFamily, Color color, double size, FontWeight fontWeight,double height) {
//   return TextStyle(
//     fontFamily: fontFamily,
//     color: color,
//     fontSize: size,
//     fontWeight: fontWeight
//   );
// }

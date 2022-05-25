import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

/* 2021.10.26(화) 수정사항 by 우수몽
 *
 * 1. lint 적용 - warning 제거
 * 2. text를 required에서 not required로 변경 -> text 파라미터가 없을 경우 체크박스만 사용할 수 있도록 함.
 */

class AppCheckbox extends StatelessWidget {
  final bool checked;
  final Function(bool?) onChecked;
  final Color checkColor;
  final String? text;

  const AppCheckbox({
    required this.checked,
    required this.onChecked,
    Color? checkColor,
    this.text,
    Key? key,
  })  : checkColor = checkColor ?? AppColor.blue300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.0,
          height: 24.0,
          child: Theme(
            data: ThemeData(unselectedWidgetColor: checkColor),
            child: Checkbox(
              value: checked,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: onChecked,
              activeColor: checkColor,
            ),
          ),
        ),
        if (text != null) const SizedBox(width: 2),
        if (text != null)
          GestureDetector(
            onTap: () {
              onChecked(!checked);
            },
            child: Text(text!,
                style: AppTextStyle.title2M1418.copyWith(color: checkColor)),
          )
      ],
    );
  }
}

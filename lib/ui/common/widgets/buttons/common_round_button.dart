import 'package:flutter/material.dart';

class CommonRoundButton extends StatelessWidget {
  const CommonRoundButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.color,
    this.elevation,
    this.textStyle,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.disabledColor,
    this.disabledTextColor,
    this.enabled = true,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color? color;
  final double? elevation;
  final TextStyle? textStyle;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: MaterialButton(
          key: key,
          onPressed: enabled ? onPressed : null,
          color: color,
          elevation: elevation,
          textColor: textColor,
          disabledColor: disabledColor,
          disabledTextColor: disabledTextColor,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle?.copyWith(
              color: enabled ? textColor : disabledTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonOutlineButton extends StatelessWidget {
  const CommonOutlineButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    this.elevation,
    this.textColor,
    this.textStyle,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.disabledTextColor,
    this.disabledColor,
    this.enabled = true,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? elevation;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    var calculatedColor = color;
    if (disabledColor != null && enabled == false) {
      calculatedColor = disabledColor!;
    }

    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        key: key,
        onPressed: enabled ? onPressed : null,
        textColor: textColor,
        elevation: elevation,
        disabledTextColor: disabledTextColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: calculatedColor),
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle?.copyWith(
            color: enabled ? textColor : disabledTextColor,
          ),
        ),
      ),
    );
  }
}

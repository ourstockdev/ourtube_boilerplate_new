import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
    this.style,
    this.height = 48,
    this.width = double.infinity,
    this.elevation,
    this.disabledColor,
    this.enabled = true,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final TextStyle? style;
  final double? elevation;
  final double height;
  final double width;
  final Color? disabledColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        key: key,
        onPressed: enabled ? onPressed : null,
        elevation: elevation,
        textColor: color,
        disabledTextColor: disabledColor,
        child: Container(
          color: Colors.transparent,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: style?.copyWith(color: enabled ? color : disabledColor),
          ),
        ),
      ),
    );
  }
}

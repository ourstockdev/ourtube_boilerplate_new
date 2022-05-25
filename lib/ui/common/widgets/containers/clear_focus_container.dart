import 'package:flutter/material.dart';

class ClearFocusContainer extends StatelessWidget {
  const ClearFocusContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).focusedChild?.unfocus();
      },
      child: child,
    );
  }
}

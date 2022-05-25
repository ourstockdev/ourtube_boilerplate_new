import 'package:flutter/widgets.dart';

// 화면 클릭 시 포커스 초기화 기능 추가
// SafeArea 바깥 영역 색상 지정 기능 추가
class BackButtonContainer extends StatelessWidget {
  const BackButtonContainer({
    Key? key,
    required this.onPressBack,
    required this.child,
    this.willPop = false,
    required this.outerAreaColor,
  }) : super(key: key);

  final VoidCallback? onPressBack;
  final Widget child;
  final bool willPop;
  final Color? outerAreaColor;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onPressBack?.call();
        return willPop;
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if(!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: (outerAreaColor == null)
            ? child
            : Container(
          color: outerAreaColor,
          child: child,
        ),
      ),
    );
  }
}

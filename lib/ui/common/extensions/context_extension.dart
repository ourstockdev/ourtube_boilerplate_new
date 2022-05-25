import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';

extension FocusExtension on BuildContext {
  void unFocus() {
    final currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  /** Flutter 2.10.0 이후 버전에서 실행 시 앱 화면 build가 멈추는 심각한 오류가 발생하는 관계로 비활성화. */
  /*void nextFocusToEditableText() {
    do {
      FocusScope.of(this).nextFocus();
    } while (
        FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }*/

  void requestFocus(FocusNode node) {
    FocusScope.of(this).requestFocus(node);
  }

  Future<void> postRequestFocus(FocusNode node) async {
    await Future.delayed(100.milliseconds);
    FocusScope.of(this).requestFocus(node);
  }
}

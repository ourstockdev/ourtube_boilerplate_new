import 'dart:async';

import 'package:get/get.dart';

/**
 * 이벤트성 데이터를 저장하는 Rx 객체에 쓰려고 만듬
 * -> Get 에서 제공하는 기존의 Rx 객체는 이벤트성 데이터에 적합하지 않음
 *
 * 예를들어 snackBar 를 띄우기 위해 뷰모델에 message 를 저장할 RxString 객체와 함수를 선언했다고 해보자.
 * >> final snackBarMessage = ''.obs;
 * >> void showSnackBar(String message) => snackBarMessage(message);
 *
 * 이제 이 snackBarMessage 를 뷰에서 listen 하다가, message 가 업데이트되면 스낵바를 띄운다
 * c.f. 스낵바를 띄우려면 context 가 필요하기 때문에 뷰에서 처리하는 것이 맞다.
 * >> vm.snackBarMessage.listen((message) {
 *     ScaffoldMessenger.of(context).showSnackBar();
 *    }
 *
 * 문제점 1.
 * 만약 여러개의 뷰에서 이 snackBarMessage 를 listen 하고 있다면?
 * '스낵바를 보여달라' 는 이벤트 요청은 한번 발생하지만 실제로 스낵바는 여러 번 화면에 나타날 것이다.
 * => 해결 : [_pending] 을 통해 하나의 listener 에게만 이벤트를 전달.
 *
 * 문제점 2.
 * 기존 Rx 객체는 이전과 동일한 value 가 set 될 경우 이벤트를 전달하지 않는다.
 * => 해결 : setter 에서 value 가 동일한 경우 강제로 refresh()
 */
class RxEvent<T> extends Rx<T> {
  RxEvent(T initial) : super(initial);

  bool _pending = false;

  @override
  StreamSubscription<T> listen(
    Function onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    if (subject.hasListeners) {
      print(
          'Multiple listeners registered but only one will be notified of changes.');
    }

    return super.listen(
      (t) {
        if (_pending) {
          _pending = false;
          onData(t);
        }
      },
    );
  }

  @override
  set value(T val) {
    _pending = true;
    if (value == val) {
      super.refresh();
    } else {
      super.value = val;
    }
  }
}

extension RxEventT<T> on T {
  Rx<T> get events => RxEvent<T>(this);
}

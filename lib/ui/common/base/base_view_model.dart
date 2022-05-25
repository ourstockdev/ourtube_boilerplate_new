import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/ui/common/helper/navigation_helper.dart';
import 'package:ourtube_boilerplate/utils/rx_event.dart';

abstract class BaseViewModel extends GetxController with _CompositeDisposableMixin {
  /**
   * SnackBar 에 표시할 메시지 저장. <br/>
   * <br/>
   * 이 [SnackBar] 는 특정 screen 의 [context] 에서 띄워야하기 때문에 [loadingBar] 와 달리 Get 에서 제공하는 스낵바를 사용하지 않는다.
   * GetX 는 Global Context 를 사용하기 때문에 특정 화면에서 백버튼 눌렀을 때 제어가 불가능함. (무조건 현재 열려있는 스낵바가 닫힘)<br/>
   * 백버튼 눌렸을 때 스낵바가 닫히는 것을 막는 등 다른 행동을 하려면 스낵바를 Global 이 아닌 현재 context 에 띄워야 한다.<br/>
   * <br/>
   *
   * [BaseScreen] 에서 listen 하고 있다가 이벤트 발생하면 스낵바를 띄워준다. <br/>
   * ```
   * c.f. base_screen.dart
   *
   * void observeRxData(BuildContext context) {
   *   vm.snackBarMessage
   *     .listen((message) => AppSnackBar.message(message).show(context))
   * }
   * ```
   */
  final snackBarMessage = ''.events;

  /**
   * 네트워크 통신 난발을 막기 위함.
   * API 쏘기 전에 loading(true) 로 lock 걸고 요청. 끝나면 loading(false) 로 lock 풀기
   *
   * [LoadingBarMixin] 쓰면 loading bar 자동으로 띄워줌
   */
  final loading = false.obs;

  /**
   * 네트워크 연결 여부 확인하는 stream.
   * 네트워크 연결이 끊길 시 현재 처리를 중단하기 위해 Exception을 리턴한다.
   */
  late final StreamSubscription<ConnectivityResult> subscription;

  /// 2022.04.04 추가 : WidgetsBindingObserver 관련 처리 추가.
  @override
  void onInit() {
    super.onInit();

    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if(event != ConnectivityResult.wifi && event != ConnectivityResult.mobile && event != ConnectivityResult.ethernet) {

      } else {

      }
    });
  }

  /// 2022.04.04 추가 : WidgetsBindingObserver 관련 처리 추가.
  @override
  void onClose() {
    disposeAll();
    super.onClose();
  }
  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  /* 이지로딩 에러 메시지 창 띄우기 */
  void showErrorMessage(String message) {
    EasyLoading.showError(message, dismissOnTap: true);
  }

  bool get isSnackBarOpen => Get.isSnackbarOpen;

  bool get isBottomSheetOpen => Get.isBottomSheetOpen ?? false;

  NavigationHelper get navigation => NavigationHelper.instance;

  /// 2022.04.04 추가 : ViewModel에서 사용하는 데이터를 refresh하는데 쓰이는 함수.
  void refreshData() => {};
}

mixin _CompositeDisposableMixin {
  /**
   *  ChangeNotifier 모아놓았다가 onClose 에서 일괄적으로 dispose 시켜주기 위함
   * [ChangeNotifier] : PageController, ScrollController, TextEditingController 등등
   */
  final _changeNotifiers =
      CompositeDisposables<ChangeNotifier>(onClear: (e) => e.dispose());

  /**
   * Rx, Stream 리스너들 모아놓았다가 onClose 에서 일괄적으로 cancel 시켜주기 위함
   */
  final _subscriptions =
      CompositeDisposables<StreamSubscription>(onClear: (e) => e.cancel());

  /**
   * ever, debounce 모아놓았다가 onClose 에서 일괄적으로 dispose 시켜주기 위함
   */
  final _workers = CompositeDisposables<Worker>(onClear: (e) => e.dispose());

  void disposeAll() {
    _changeNotifiers.clearAll();
    _subscriptions.clearAll();
  }
}

class CompositeDisposables<T> {
  CompositeDisposables({required this.onClear});

  final _disposables = <T>[];

  final void Function(T) onClear;

  void add(T disposable) => _disposables.add(disposable);

  void clearAll() {
    for (final element in _disposables) {
      onClear(element);
    }
    _disposables.clear();
  }
}

extension DisposableExtension on ChangeNotifier {
  void bindTo(BaseViewModel viewModel) {
    viewModel._changeNotifiers.add(this);
  }
}

extension StreamSubscriptionExtension on StreamSubscription {
  void bindTo(BaseViewModel viewModel) {
    viewModel._subscriptions.add(this);
  }
}

extension WorkerExtension on Worker {
  void bindTo(BaseViewModel viewModel) {
    viewModel._workers.add(this);
  }
}

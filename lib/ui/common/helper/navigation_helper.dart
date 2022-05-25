import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/ui/common/base/base_view_model.dart';

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();

  factory NavigationHelper() => _instance;

  static NavigationHelper get instance => _instance;

  NavigationHelper._internal();

  /// 라우팅 스택(기존 GetX나 Flutter에서 제공하는 것이 쓰기 어렵고 빈약해서 새로 만듬)
  // final stack.Stack<String> _routingStack = stack.Stack();

  /**
   * 현재 Screen 닫고 [page] 새로 열기
   */
  Future<void> finishAndOpen(String page, {dynamic arguments, Map<String, String>? parameters}) async {
    // assert(_routingStack.isNotEmpty);

    await Get.offAndToNamed(page, arguments: arguments, parameters: parameters);
    // _routingStack.pop();
    // _routingStack.push(page);
  }

  /**
   * 열려있는 모든 Screen 닫고 [page] 새로 열기
   */
  Future<void> finishAllAndOpen(String page, {dynamic arguments}) async {
    // assert(_routingStack.isNotEmpty);

    await Get.offAllNamed(page, arguments: arguments);
    // _routingStack.popAll();
    // _routingStack.push(page);
  }

  /**
   * [until] 위에 열려있는 Screen 모두 닫고 [page] 새로 열기
   */
  /*Future<void> finishUntilAndOpen(
    String page, {
    required String until,
    dynamic arguments,
  }) async {
    await Get.offNamedUntil(page, ModalRoute.withName(until), arguments: arguments);
  }*/

  /**
   * [page] 새로 열기
   */
  Future<void> open(String page, {dynamic arguments, Map<String, String>? parameters}) async {
    await Get.toNamed(page, arguments: arguments, parameters: parameters);
    // _routingStack.push(page);
  }

  /**
   * [until]로 돌아가기 (위에 열려있던 Screen 모두 닫음)
   */
  void finishUntil(String until) {
    Get.until((route) {
      return !route.willHandlePopInternally
          && route is ModalRoute
          && route.settings.name == until;
      /*if(!route.willHandlePopInternally
          && route is ModalRoute
          && route.settings.name == until) {
        return true;
      } else {
        _routingStack.pop();
        return false;
      }*/
    });
  }

  /**
   * 현재 페이지 닫기
   */
  void finish<T>({T? result}) {
    Get.back<T>(result: result);
    // _routingStack.pop();
  }

  /**
   * 앱 종료
   */
  Future<void> finishApp() async {
    // _routingStack.popAll();
    await SystemNavigator.pop();
    exit(1);
  }

  /**
   * 2022.04.01 추가 : 특정 ViewModel의 데이터를 재로딩하면서 뒤로 가는 함수 추가.
   */
  void finishWithRefreshViewModel<T extends BaseViewModel>() {
    // assert(_routingStack.isNotEmpty);

    final controller = Get.find<T>();
    controller.refreshData();
    finish();
    // _routingStack.pop();
  }

  /**
   * 2022.04.18 추가 : 이미 메모리에 추가된 컨트롤러를 전부 초기화하는 함수 추가.
   * (모든 라우팅을 초기화하고 Login Page나 Home Page로 되돌아갈 때 같이 사용한다.)
   */
  /*void reset() {
    Get.reset();
  }*/
}

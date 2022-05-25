import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ourtube_boilerplate/data/remote/network/common/exception/network_connect_exception.dart';

abstract class RequestInterceptor {
  static void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    ///  인터넷 연결 상태를 확인함
    final connectivity = await Connectivity().checkConnectivity();
    if(connectivity == ConnectivityResult.wifi
        || connectivity == ConnectivityResult.ethernet
        || connectivity == ConnectivityResult.mobile) {
      handler.next(options);
    } else {
      // 인터넷에 연결되어 있지 않음
      handler.reject(NetworkConnectException(requestOptions: options));
    }
  }
}

import 'package:dio/dio.dart';

class NetworkConnectException extends DioError {
  @override
  final String message = '네트워크 연결이 원활하지 않습니다. 다시 시도해 주세요.';

  NetworkConnectException({required RequestOptions requestOptions}) : super(requestOptions: requestOptions);
}
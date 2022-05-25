import 'dart:convert';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/interceptor/error_interceptor.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/interceptor/request_interceptor.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/interceptor/response_interceptor.dart';

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class AppDio {
  // Release Mode, Debug Mode에 따라 다른 baseUrl을 사용함.
  static const String baseUrl = kReleaseMode ? '' : '';

  AppDio._internal();

  static Dio? _instance;

  static Dio getInstance() => _instance ??= _AppDio();
}

class _AppDio with DioMixin implements Dio {
  _AppDio() {
    httpClientAdapter = DefaultHttpClientAdapter();
    options = BaseOptions(
      baseUrl: AppDio.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      // http 상태 코드가 200대(성공)이 아니더라도 응답 데이터를 수신하는지 여부.
      receiveDataWhenStatusError: true,
      headers: <String, dynamic>{
        'accept': 'application/json',
      },
    );
    /// 2022.05.16 추가 : compute 함수를 이용한 Json transformer 추가
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onRequest: RequestInterceptor.onRequest,
        onResponse: ResponseInterceptor.onResponse,
        onError: ErrorInterceptor.onError,
      ),
    ]);
  }
}

import 'package:dio/dio.dart';
import 'package:ourtube_boilerplate/data/remote/network/common/exception/api_exception.dart';
import 'package:ourtube_boilerplate/data/remote/network/common/response/error_response.dart';
import '../../../../../app/typedefs/callback.dart';

/// errorCode 에 해당하는 NetworkException 을 매핑해주는 map
final exceptionMapper = <String, NetworkExceptionCallback>{
  'Forbidden': () => NetworkException.unauthorized(),
};

abstract class ErrorInterceptor {
  ErrorInterceptor._();

  /// 모든 API 통신에서 미리 정의된 에러의 response.data 는 ErrorResponse 형태로 내려온다<br/>
  /// <예시><br/>
  /// ```
  /// {
  ///   "statusCode": 400,
  ///   "timestamp": "2021-01-01 01:01:01",
  ///   "path": "uri path",
  ///   "errorCode": "00103"
  /// }
  /// ```
  /// 서버에서 위와 같은 형태로 에러가 떨어진 경우<br/>
  /// <STEP 1> response data 를 ErrorResponse 로 변환<br/>
  /// <STEP 2> errorCode 에 해당하는 NetworkException 으로 변환. [exceptionMapper] 참고<br/>
  /// <STEP 3> DioError.error 에 해당 NetworkException 담아서 반환<br/>
  static void onError(DioError err, ErrorInterceptorHandler handler) {
    /// TODO : 서버 쪽에서 응답 양식 정해지면 변경
    if (err.response?.statusCode == 504) {
      err.error = const ServerUnderMaintenanceException('');
      handler.next(err);
      return;
    }
    else if (err.response?.statusCode == 304) {
      err.error = NetworkException.notModified();
      handler.next(err);
      return;
    }
    else if (err.response?.statusCode != null && err.response!.statusCode! >= 500) {
      // 서버 오류인 경우 : 서버 오류 리턴
      err.error = NetworkException.serverNotRespond();
      handler.next(err);
      return;
    }

    final json = err.response?.data;

    if (json is Map<String, dynamic>) {
      /* <STEP 1> */
      final response = ErrorResponse.fromJson(json);

      /* <STEP 2, STEP 3> */
      // exceptionMap 에 정의되어 있지 않은 errorCode 의 경우 ApiUnknownException 으로 변환
      err.error = exceptionMapper[response.errorCode]?.call() ??
          NetworkException.unknown();
    }

    handler.next(err);
  }
}

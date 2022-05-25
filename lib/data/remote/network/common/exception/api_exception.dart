import 'package:flutter/foundation.dart';

/**
 * HTTP 통신에서 정의된 에러는 모두 [NetworkException] 을 상속받도록 한다
 * HTTP 통신 자체의 에러인지, 서버에서 떨어진 에러인지 구분하기 위함
 */
@immutable
class NetworkException extends FormatException {
  const NetworkException([String? message]) : super(message ?? '');

  /**
   * 304 에러
   */
  factory NetworkException.notModified() => const NetworkException();

  /**
   * JwtToken 만료 등의 이유로 Authorization 실패
   */
  factory NetworkException.unauthorized() => const NetworkException();

  /**
   * 5xx 에러 : 서버와 통신 불가능한 상태
   */
  factory NetworkException.serverNotRespond() => const NetworkException('서버가 응답하지 않습니다. 일시적인 오류일 수 있으니, 추후 다시 시도해주세요.');

  /**
   * Exception Mapper 에 없는 (알 수 없는) 에러들
   */
  factory NetworkException.unknown() =>
      const NetworkException('알 수 없는 오류입니다. 잠시 후 다시 시도해주세요');
}

/**
 * API Response 에 문제가 있을 때. 일시적인 문제일 확률이 커서 retry 필요한 에러들.
 *
 * 예를들어 not-null value 에 null 값이 들어올 때. 등
 */
@immutable
class ApiBadResponseException extends NetworkException {
  const ApiBadResponseException([String? message]) : super(message);

  factory ApiBadResponseException.nullPointer(String? field) =>
      ApiBadResponseException('Null in NonNull Field: $field');
}

/**
 * 서버 점검
 */
@immutable
class ServerUnderMaintenanceException extends NetworkException {
  const ServerUnderMaintenanceException(String message) : super(message);
}
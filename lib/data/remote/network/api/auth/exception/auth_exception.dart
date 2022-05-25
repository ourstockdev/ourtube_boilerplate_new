import 'package:flutter/foundation.dart';
import '../../../common/exception/api_exception.dart';

abstract class AuthException extends NetworkException {
  const AuthException(String message) : super(message);
}

@immutable
class UserNicknameAlreadyExistsException extends AuthException {
  const UserNicknameAlreadyExistsException() : super('이미 존재하는 별명입니다');
}

@immutable
class UserEmailAlreadyExistsException extends AuthException {
  const UserEmailAlreadyExistsException() : super('이미 가입된 이메일입니다');
}

@immutable
class RecommenderCodeIsNotExistException extends AuthException {
  const RecommenderCodeIsNotExistException() : super('유효하지 않은 추천인 코드입니다.');
}

@immutable
class UserNotFoundException extends AuthException {
  const UserNotFoundException() : super('가입하지 않은 아이디입니다');
}

@immutable
class InvalidPasswordException extends AuthException {
  const InvalidPasswordException() : super('잘못된 비밀번호입니다');
}

@immutable
class InvalidTokenException extends AuthException {
  const InvalidTokenException() : super('유효하지 않은 토큰입니다.');
}

@immutable
class AlreadyRegisteredUserException extends AuthException {
  const AlreadyRegisteredUserException() : super('이미 가입한 유저입니다. 가입한 계정으로 로그인해주세요.');
}
import 'package:dio/dio.dart';
import '../network/common/exception/api_exception.dart';

mixin ApiErrorHandlerMixin {
  Future<T> loadResponseOrThrow<T>(Future<T> Function() actionApi) async {
    try {
      return await actionApi.call();
    } on DioError catch (e) {
      final exception = e.error;
      if (exception is NetworkException) throw exception;
      rethrow;
    }
  }
}

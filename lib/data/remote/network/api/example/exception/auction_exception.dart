import 'package:ourtube_boilerplate/data/remote/network/common/exception/api_exception.dart';

abstract class ExampleException extends NetworkException {
  const ExampleException(String message) : super(message);
}

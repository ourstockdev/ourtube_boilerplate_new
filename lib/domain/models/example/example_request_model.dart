import 'package:ourtube_boilerplate/data/remote/network/api/example/request/example_request.dart';
import 'package:ourtube_boilerplate/domain/enums/example_type.dart';

class ExampleRequestModel {
  final int reqInt;
  final ExampleType type;

  const ExampleRequestModel({
    required this.reqInt,
    required this.type,
  });

  ExampleRequest toRequest() => ExampleRequest(intReq: reqInt, type: type.name);
}
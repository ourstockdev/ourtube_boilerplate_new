import 'package:ourtube_boilerplate/domain/models/example/example_model.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_request_model.dart';
import 'package:ourtube_boilerplate/utils/result.dart';

abstract class ExampleRepository {
  Future<Result<ExampleModel>> getExample(String id);

  Future<Result<ExampleModel>> postExample(ExampleRequestModel request);

  Future<Result<ExampleModel>> deleteExample(ExampleRequestModel request);
}

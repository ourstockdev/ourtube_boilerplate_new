import 'package:ourtube_boilerplate/data/repository/example/example_repository.dart';
import 'package:ourtube_boilerplate/domain/base/base_use_case.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_model.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_request_model.dart';
import 'package:ourtube_boilerplate/utils/result.dart';

class PostExampleUseCase extends BaseUseCase<ExampleRequestModel, Result<ExampleModel>> {
  final ExampleRepository _repository;

  PostExampleUseCase(this._repository);

  @override
  Future<Result<ExampleModel>> call(ExampleRequestModel request) {
    return _repository.postExample(request);
  }
}
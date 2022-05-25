import 'package:ourtube_boilerplate/data/remote/source/example/example_remote_data_source.dart';
import 'package:ourtube_boilerplate/data/repository/example/example_repository.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_model.dart';
import 'package:ourtube_boilerplate/domain/models/example/example_request_model.dart';
import 'package:ourtube_boilerplate/utils/result.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleRemoteDataSource _dataSource;

  ExampleRepositoryImpl(this._dataSource);

  @override
  Future<Result<ExampleModel>> getExample(String id) async {
    try {
      final response = await _dataSource.getExample(id);
      return Result.success(ExampleModel.fromResponse(response));
    } on Exception catch(e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ExampleModel>> postExample(ExampleRequestModel request) async {
    try {
      final response = await _dataSource.postExample(request.toRequest());
      return Result.success(ExampleModel.fromResponse(response));
    } on Exception catch(e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ExampleModel>> deleteExample(ExampleRequestModel request) async {
    try {
      final response = await _dataSource.deleteExample(request.toRequest());
      return Result.success(ExampleModel.fromResponse(response));
    } on Exception catch(e) {
      return Result.failure(e);
    }
  }
}
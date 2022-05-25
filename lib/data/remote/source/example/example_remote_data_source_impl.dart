import 'package:ourtube_boilerplate/data/remote/source/example/example_remote_data_source.dart';
import '../../../local/source/user/user_local_data_source.dart';
import '../../network/api/auth/exception/auth_exception.dart';
import '../../network/api/example/example_api.dart';
import '../../network/api/example/request/example_request.dart';
import '../../network/api/example/response/example_response.dart';
import '../api_error_handler_mixin.dart';

class ExampleRemoteDataSourceImpl with ApiErrorHandlerMixin implements ExampleRemoteDataSource {
  final ExampleApi _exampleApi;
  final UserLocalDataSource _localDataSource;

  ExampleRemoteDataSourceImpl(this._exampleApi, this._localDataSource);

  @override
  Future<ExampleResponse> getExample(String id) =>
      loadResponseOrThrow(() {
        if(_localDataSource.loadJwtToken() == null) {
          throw const InvalidTokenException();
        }

        return _exampleApi.getExample(_localDataSource.loadJwtToken()!, id);
      });

  @override
  Future<ExampleResponse> postExample(ExampleRequest request) =>
      loadResponseOrThrow(() {
        if(_localDataSource.loadJwtToken() == null) {
          throw const InvalidTokenException();
        }

        return _exampleApi.postExample(_localDataSource.loadJwtToken()!, request);
      });

  @override
  Future<ExampleResponse> deleteExample(ExampleRequest request) =>
      loadResponseOrThrow(() {
        if(_localDataSource.loadJwtToken() == null) {
          throw const InvalidTokenException();
        }

        return _exampleApi.deleteExample(_localDataSource.loadJwtToken()!, request);
      });
}

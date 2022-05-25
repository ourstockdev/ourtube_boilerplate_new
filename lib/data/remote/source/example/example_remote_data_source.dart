import '../../network/api/example/request/example_request.dart';
import '../../network/api/example/response/example_response.dart';

abstract class ExampleRemoteDataSource {
  Future<ExampleResponse> getExample(String id);

  Future<ExampleResponse> postExample(ExampleRequest request);

  Future<ExampleResponse> deleteExample(ExampleRequest request);
}

import 'package:dio/dio.dart';
import 'package:ourtube_boilerplate/data/remote/network/api/example/request/example_request.dart';
import 'package:ourtube_boilerplate/data/remote/network/api/example/response/example_response.dart';
import 'package:retrofit/retrofit.dart';

/// part '(클래스파일명).g.dart';
part 'example_api.g.dart';

@RestApi()
abstract class ExampleApi {
  /// factory (클래스명)(Dio dio, {String baseUrl}) = _(클래스명);
  factory ExampleApi(Dio dio, {String baseUrl}) = _ExampleApi;

  // GET 메서드 예시
  @GET('baseUrl을 제외한 주소/{id}')
  Future<ExampleResponse> getExample(
    /// 헤더에 token이 들어가는 경우 기입.
    @Header('Authorization') String token,
    /// Path()의 경우, Path()의 변수명과 위 주소에서의 변수명은 동일해야 한다.
    @Path() String id,
  );

  // POST 메서드 예시
  @POST('baseUrl을 제외한 주소')
  Future<ExampleResponse> postExample(
    @Header('Authorization') String token,
    /// Body에 들어갈 Request JSON
    @Body() ExampleRequest request,
  );

  // DELETE 메서드 예시
  @DELETE('baseUrl을 제외한 주소')
  Future<ExampleResponse> deleteExample(
    @Header('Authorization') String token,
    @Body() ExampleRequest request,
  );
}

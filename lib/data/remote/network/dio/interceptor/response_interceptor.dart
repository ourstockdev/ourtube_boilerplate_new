import 'package:dio/dio.dart';

abstract class ResponseInterceptor {
  ResponseInterceptor._();

  /// 서버에서 아래와 같은 형태의 Response 가 떨어지면, response data 를 뽑아서 반환<br/>
  ///  ```
  /// {
  ///   "data": { ... },
  ///   "statusCode": 0
  /// }
  /// ```
  ///
  /// 서버에서 아래와 같은 Paged Response 가 떨어지면, <br/>
  ///  ```
  /// {
  ///   "data": {
  ///    "dataList": [ ... ],
  ///    "meta": { ... },
  ///    "link": { ... },
  ///   },
  ///   "statusCode": 0
  /// }
  /// ```
  /// <STEP 1> meta + links 합쳐서 새로운 맵 (newResponseMap) 의 'metaData' 에 추가
  /// <STEP 2> 실제 데이터 리스트 는 새로운 맵 (newResponseMap) 의 'dataList' 에 추가
  /// <STEP 3> response.data 에 newResponseMap 을 담아서 반환
  static void onResponse(
      Response response, ResponseInterceptorHandler handler) {
    final json = response.data;

    if (json is Map<String, dynamic>) {
      final responseMap = json['data'];

      if (responseMap is Map<String, dynamic> &&
          responseMap.containsKey('meta')) {
        final newResponseMap = <String, dynamic>{};
        final metaData = <String, dynamic>{};

        /* TODO: link 랑 links 네이밍 서버에서 통일해주면 수정하기
        *  어떤건 link, 어떤건 links 로 와서 강제 통일 시킴 */
        metaData.addAll(responseMap['meta']);
        metaData.addAll(responseMap['links'] ?? <String, dynamic>{});
        metaData.addAll(responseMap['link'] ?? <String, dynamic>{});

        newResponseMap['metaData'] = metaData;

        /** TODO: 페이징 entries 네이밍 서버에서 통일해주면 수정하기
         * 네이밍 통일 안되어있어서 forEach 돌려야함. 임시로 'dataList' 로 강제 통일시킴 */
        for (final entry in responseMap.entries) {
          if (entry.key != 'meta' &&
              entry.key != 'links' &&
              entry.key != 'link') {
            newResponseMap['dataList'] = entry.value;
          }
        }

        handler.next(response..data = newResponseMap);
        return;
      }

      /** TODO : 리스트로 리턴되는 API에서 리스트가 비어 있는 경우, {"data":[null],"statusCode":200}과 같은 형태로 리턴되는 경우가 있음. */
      else if(responseMap is List<dynamic> && responseMap.contains(null)) {
        final List<dynamic> newResponse = [];
        for(var item in responseMap) {
          if(item != null) {
            newResponse.add(item);
          }
        }

        handler.next(response..data = newResponse);
        return;
      }

      handler.next(response..data = responseMap);
      return;
    }

    handler.next(response);
  }
}

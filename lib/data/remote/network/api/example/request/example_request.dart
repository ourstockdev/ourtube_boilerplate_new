import 'package:json_annotation/json_annotation.dart';

/// part '(클래스파일명).g.dart';
part 'example_request.g.dart';

/* 예시 Request JSON 객체 */
/* 원본 JSON :
 * {
 *    "intRequest": 0,
 *    "strRequest": ""
 * }
 */
@JsonSerializable(explicitToJson: true, createFactory: false)
class ExampleRequest {
  @JsonKey(name: 'intRequest')
  final int intReq;

  @JsonKey(name: 'strRequest')
  final String type;

  ExampleRequest({
    required this.intReq,
    required this.type,
  });

  /// Map<String, dynamic> toJson() => _$(클래스이름)ToJson(this);
  Map<String, dynamic> toJson() =>
      _$ExampleRequestToJson(this);
}

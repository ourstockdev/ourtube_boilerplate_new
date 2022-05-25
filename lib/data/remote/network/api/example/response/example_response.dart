import 'package:json_annotation/json_annotation.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/converter/int_converter.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/converter/string_converter.dart';

/// part '(클래스파일명).g.dart';
part 'example_response.g.dart';

/* 예시 Response JSON 객체 */
/* 원본 JSON :
 * {
 *    "strResponse": "~~~~~",
 *    "intResponse": 0,
 *    "strNullable": "~~~~~",
 *    "intNullable": 1
 * }
 */
@JsonSerializable(createToJson: false)
class ExampleResponse {
  @JsonKey(name: 'strResponse')
  final String type;

  @JsonKey(name: 'intResponse')
  final int intRes;

  /// nullable한 경우 타입에 맞는 Converter 붙이기
  @JsonKey(name: 'strNullable')
  @StringConverter()
  final String? strNullable;

  /// nullable한 경우 타입에 맞는 Converter 붙이기
  @JsonKey(name: 'intNullable')
  @IntConverter()
  final int? intNullable;

  const ExampleResponse({
    required this.type,
    required this.intRes,
    required this.strNullable,
    required this.intNullable,
  });

  /// factory (클래스이름).fromJson(Map<String, dynamic> json) => _$(클래스이름)FromJson(json);
  factory ExampleResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleResponseFromJson(json);
}
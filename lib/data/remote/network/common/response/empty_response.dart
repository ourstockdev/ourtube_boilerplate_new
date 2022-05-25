import 'package:json_annotation/json_annotation.dart';

part 'empty_response.g.dart';

@JsonSerializable(createToJson: false)
class EmptyResponse {
  EmptyResponse();

  factory EmptyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmptyResponseFromJson(json);
}

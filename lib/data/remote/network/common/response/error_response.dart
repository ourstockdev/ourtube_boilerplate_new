import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/converter/int_converter.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/converter/string_converter.dart';

part 'error_response.g.dart';

@JsonSerializable(createToJson: false)
class ErrorResponse extends Equatable {
  @JsonKey(name: 'errorCode', defaultValue: '')
  @StringConverter()
  final String errorCode;

  @JsonKey(name: 'statusCode', defaultValue: 0)
  @IntConverter()
  final int statusCode;

  const ErrorResponse({
    required this.errorCode,
    required this.statusCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  @override
  List<Object?> get props => [
        {'errorCode': errorCode},
        {'statusCode': statusCode},
      ];
}

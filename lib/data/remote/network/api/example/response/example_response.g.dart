// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleResponse _$ExampleResponseFromJson(Map<String, dynamic> json) =>
    ExampleResponse(
      type: json['strResponse'] as String,
      intRes: json['intResponse'] as int,
      strNullable: const StringConverter().fromJson(json['strNullable']),
      intNullable: const IntConverter().fromJson(json['intNullable']),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedResponse<T> _$PagedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagedResponse<T>(
      metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      dataList: (json['dataList'] as List<dynamic>).map(fromJsonT).toList(),
    );

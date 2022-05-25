import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/converter/int_converter.dart';
import 'package:ourtube_boilerplate/data/remote/network/dio/converter/string_converter.dart';

part 'meta_data.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class MetaData {
  @JsonKey(name: 'first', defaultValue: '')
  @StringConverter()
  final String first;

  @JsonKey(name: 'previous', defaultValue: '')
  @StringConverter()
  final String previous;

  @JsonKey(name: 'next', defaultValue: '')
  @StringConverter()
  final String next;

  @JsonKey(name: 'last', defaultValue: '')
  @StringConverter()
  final String last;

  @JsonKey(name: 'itemCount', defaultValue: 0)
  @IntConverter()
  final int itemCount;

  @JsonKey(name: 'totalItems', defaultValue: 0)
  @IntConverter()
  final int totalItems;

  @JsonKey(name: 'itemsPerPage', defaultValue: 0)
  @IntConverter()
  final int itemsPerPage;

  @JsonKey(name: 'totalPages', defaultValue: 0)
  @IntConverter()
  final int totalPages;

  @JsonKey(name: 'currentPage', defaultValue: 0)
  @IntConverter()
  final int currentPage;

  const MetaData({
    required this.itemCount,
    required this.totalItems,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
    required this.first,
    required this.previous,
    required this.next,
    required this.last,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}

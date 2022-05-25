import 'package:json_annotation/json_annotation.dart';
import 'package:ourtube_boilerplate/data/remote/network/common/pagination/meta_data.dart';

part 'paged_response.g.dart';

/** TODO: 서버에서 dataList 네이밍 통일이 필요함. */
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PagedResponse<T> {
  @JsonKey(name: 'metaData')
  final MetaData metaData;

  @JsonKey(name: 'dataList')
  final List<T> dataList;

  PagedResponse({
    required this.metaData,
    required this.dataList,
  });

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) fromJsonT,
  ) =>
      _$PagedResponseFromJson(
        json,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
}

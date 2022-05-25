import 'package:ourtube_boilerplate/data/remote/network/api/example/response/example_response.dart';
import 'package:ourtube_boilerplate/domain/enums/example_type.dart';

class ExampleModel {
  final int resInt;
  final int? resIntNullable;
  final String? resStringNullable;
  final ExampleType type;

  const ExampleModel({
    required this.resInt,
    required this.resIntNullable,
    required this.resStringNullable,
    required this.type,
  });

  factory ExampleModel.fromResponse(ExampleResponse response) => ExampleModel(
    resInt: response.intRes,
    resIntNullable: response.intNullable,
    type: ExampleType.fromString(response.type),
    resStringNullable: response.strNullable,
  );
}
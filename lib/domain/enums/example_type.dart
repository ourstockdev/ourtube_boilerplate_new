import 'dart:ui';
import '../../app/resources/colors/colors.dart';

enum ExampleType {
  type1(name: 'type1', contentColor: AppColor.red300),
  type2(name: 'type2', contentColor: AppColor.blue300);

  final String name;
  final Color contentColor;

  const ExampleType({
    required this.name,
    required this.contentColor,
  });

  factory ExampleType.fromString(String originStr) {
    switch(originStr) {
      case 'type1': return ExampleType.type1;
      case 'type2': return ExampleType.type2;
      default: throw Exception('enum not found');
    }
  }
}
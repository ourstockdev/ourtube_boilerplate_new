import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';
import 'package:ourtube_boilerplate/ui/common/base/base_screen.dart';
import 'package:ourtube_boilerplate/ui/screens/example/example_view_model.dart';

class ExampleScreen extends BaseScreen<ExampleViewModel> {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      /// data가 null이냐 아니냐에 따라 로딩 처리
      child: (vm.data == null)
          ? const CircularProgressIndicator()
          : Text(
        vm.data!.type.name,
        style: AppTextStyle.title1R1618.copyWith(color: vm.data!.type.contentColor),
      ),
    );
  }
}
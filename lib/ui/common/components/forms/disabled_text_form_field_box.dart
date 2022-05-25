import 'package:flutter/material.dart';
import 'package:ourtube_boilerplate/app/config/size_config.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/radius.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/space.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';

class DisabledTextFormFieldBox extends StatelessWidget {
  const DisabledTextFormFieldBox({
    Key? key,
    required this.contents,
  }) : super(key: key);

  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInset.horizontal16 + AppInset.vertical20,
      width: SizeConfig().safeAreaWidth,
      decoration: const BoxDecoration(
        borderRadius: AppRadius.all8,
        color: AppColor.gray150,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contents.length,
        itemBuilder: (_, index) => Text(
          contents[index],
          style: AppTextStyle.title1R1618,
        ),
        separatorBuilder: (_, __) => AppSpace.size24,
      ),
    );
  }
}

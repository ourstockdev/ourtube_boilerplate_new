import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/app/config/size_config.dart';
import 'package:ourtube_boilerplate/ui/common/base/base_view_model.dart';

@immutable
abstract class BaseView<T extends BaseViewModel> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  T get vm => controller;

  double get safeAreaHeight => SizeConfig().safeAreaHeight;

  double get appBarHeight => SizeConfig().appBarHeight;

  @override
  Widget build(BuildContext context) {
    initViewModel();
    observeRxData(context);
    return buildView(context);
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  @mustCallSuper
  void observeRxData(BuildContext context) {}

  Widget buildView(BuildContext context);
}

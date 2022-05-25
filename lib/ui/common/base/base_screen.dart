import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/app/config/size_config.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/ui/common/base/base_view_model.dart';
import 'package:ourtube_boilerplate/ui/common/extensions/snack_bar_extension.dart';
import 'package:ourtube_boilerplate/ui/common/widgets/containers/back_button_container.dart';

@immutable
abstract class BaseScreen<T extends BaseViewModel> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* init view model */
    initViewModel();
    observeRxData(context);

    /* build screen */
    return BackButtonContainer(
      onPressBack: onPressBack,
      outerAreaColor: (setOuterAreaColor == null) ? setOuterAreaColor : setBackgroundColor,
      child: wrapWithSafeArea
          ? SafeArea(child: _buildScaffold(context))
          : _buildScaffold(context),

      /*ClearFocusContainer(
        child: wrapWithSafeArea
            ? SafeArea(child: _buildScaffold(context))
            : _buildScaffold(context),
      ),*/
    );
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  @mustCallSuper
  void observeRxData(BuildContext context) {
    showSnackBarWhenMessageEmitted(context, vm);
  }

  /* 스낵바 띄우기 */
  @protected
  void showSnackBarWhenMessageEmitted(
    final BuildContext context,
    final BaseViewModel vm,
  ) {
    vm.snackBarMessage
        .listen((message) => SnackBarHelper.message(message).show(context))
        .bindTo(vm);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
      body: buildBody(context),
      backgroundColor: setBackgroundColor,
      floatingActionButton: buildFloatingActionButton(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  @protected
  Color? get setBackgroundColor => AppColor.wh;

  @protected
  Color? get setOuterAreaColor => AppColor.wh;

  @protected
  Widget buildBody(BuildContext context);

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget? buildFloatingActionButton(BuildContext context) => null;

  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @protected
  VoidCallback get onPressBack => Get.back;

  @protected
  bool get wrapWithSafeArea => true;

  @protected
  T get vm => controller;

  @protected
  double get safeAreaHeight => SizeConfig().safeAreaHeight;

  @protected
  double get appBarHeight => SizeConfig().appBarHeight;
}

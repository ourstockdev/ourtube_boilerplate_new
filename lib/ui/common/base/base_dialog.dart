import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_boilerplate/ui/common/typedefs/binding_creator.dart';

/** Bindings 객체를 포함한 Dialog, bottomSheet를 생성하기 위한 것.
 *  사용법 : https://github.com/jonataslaw/getx/discussions/1167
 */
abstract class BaseDialog<Binding extends Bindings, Controller> extends GetView<Controller> {
  final BindingCreator<Binding>? bindingCreator;

  const BaseDialog({
    Key? key,
    required this.bindingCreator,
  }) : super(key: key);

  @protected
  Widget view();

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    _createBinding();
    return view();
  }

  void _createBinding() {
    Binding? binding = bindingCreator?.call();
    binding?.dependencies();
  }
}
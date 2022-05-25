import 'package:get/get.dart';
import 'package:ourtube_boilerplate/ui/screens/example/example_view_model.dart';

class ExampleBinding implements Bindings {
  @override
  void dependencies() {
    /// 모든 객체는 dependencies에서 의존성 주입을 미리 할 것이기 때문에, 생성자의 파라미터에는 Get.find()만 넣어주어도 충분하다.
    Get.put<ExampleViewModel>(ExampleViewModel(Get.find()));
  }
}
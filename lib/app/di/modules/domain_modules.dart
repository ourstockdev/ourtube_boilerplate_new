import 'package:get/get.dart';
import 'package:ourtube_boilerplate/domain/usecases/example/post_example_use_case.dart';

abstract class DomainModules {
  DomainModules._();

  static void dependencies() {
    /** use cases */
    /// 모든 객체는 dependencies에서 의존성 주입을 미리 할 것이기 때문에, 생성자의 파라미터에는 Get.find()만 넣어주어도 충분하다.
    Get.lazyPut(() => PostExampleUseCase(Get.find()));
  }
}

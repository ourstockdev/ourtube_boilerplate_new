import 'package:get/get.dart';
import 'modules/domain_modules.dart';
import 'modules/local_modules.dart';
import 'modules/remote_modules.dart';
import 'modules/repository_modules.dart';

/** dependencies() 함수가 async이기 때문에, SplashViewModel의 init 및 ready가 AppBinding보다도 먼저 이루어진다는 문제가 있다.
 *
 *  이 때문에, SplashViewModel에서 Get.find()를 실행하기 이전에 1초 정도 딜레이를 주어서, AppBinding이 다 끝난 뒤에 Get.find()가 이루어지도록 해야 한다.
 */
class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await LocalModules.dependencies();
    RemoteModules.dependencies();
    RepositoryModules.dependencies();
    DomainModules.dependencies();
  }
}

import 'package:get/get.dart';
import 'package:ourtube_boilerplate/data/local/source/user/user_local_data_source.dart';
import 'package:ourtube_boilerplate/data/local/source/user/user_local_data_source_impl.dart';

import '../../../data/local/persistence/dao/config/config_dao.dart';
import '../../../data/local/persistence/dao/user/user_dao.dart';

abstract class LocalModules {
  LocalModules._internal();

  static Future<void> dependencies() async {
    /// 모든 객체는 dependencies에서 의존성 주입을 미리 할 것이기 때문에, 생성자의 파라미터에는 Get.find()만 넣어주어도 충분하다.
    Get.lazyPut(() => ConfigDao(Get.find()), fenix: true);
    Get.lazyPut(() => UserDao(Get.find()), fenix: true);

    Get.lazyPut<UserLocalDataSource>(
          () => UserLocalDataSourceImpl(Get.find(), Get.find()),
      fenix: true,
    );
  }
}

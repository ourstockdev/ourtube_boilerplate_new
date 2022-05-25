import 'package:get/get.dart';
import '../../../data/repository/example/example_repository.dart';
import '../../../data/repository/example/example_repository_impl.dart';

abstract class RepositoryModules {
  RepositoryModules._();

  static void dependencies() {
    Get.lazyPut<ExampleRepository>(
      () => ExampleRepositoryImpl(Get.find()),
      fenix: true,
    );
  }
}

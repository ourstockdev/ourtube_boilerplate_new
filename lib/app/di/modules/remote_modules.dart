import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../data/remote/network/api/example/example_api.dart';
import '../../../data/remote/network/dio/app_dio.dart';

abstract class RemoteModules {
  RemoteModules._();

  static void dependencies() {
    Get.put<Dio>(AppDio.getInstance(), permanent: true);

    Get.lazyPut(() => ExampleApi(Get.find<Dio>()), fenix: true);
  }
}

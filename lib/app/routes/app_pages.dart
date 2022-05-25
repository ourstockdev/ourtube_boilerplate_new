import 'package:get/get.dart';
import 'package:ourtube_boilerplate/ui/screens/example/example_binding.dart';
import 'package:ourtube_boilerplate/ui/screens/example/example_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.example,
      page: () => const ExampleScreen(),
      binding: ExampleBinding(),
    ),
  ];
}

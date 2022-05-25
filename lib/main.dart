import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'app/config/equatable_config.dart';
import 'app/config/http_config.dart';
import 'app/config/loading_config.dart';
import 'app/config/size_config.dart';
import 'app/di/app_binding.dart';
import 'app/resources/themes/theme_data.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debug 빌드에서만 http certification 설정
  if (kDebugMode) {
    HttpOverrides.global = AppHttpOverrides();
  }

  // 앱 설정 init
  AppLoadingConfig.init();
  AppEquatableConfig.init();

  /// SplashScreen에서 사용할 dependencies 미리 주입
  // await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.splash,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      title: 'Ourtube',
      theme: ThemeConfig.lightTheme,
      builder: (context, child) {
        SizeConfig().init(context);
        return EasyLoading.init()(context, child);
      },

      // Google Analytics 설정 : PageRoute Transitions
      /*navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],*/
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:get/get.dart';

import 'core/core_exports.dart';
import 'feature/presentation/screens/screens_export.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: AppLocales.fallbackLocale,
      initialBinding: AppBindings(),
      theme: LightTheme.value,
      darkTheme: DarkTheme.value,
      themeMode: ThemeMode.system,
      initialRoute: Get.find<LocalStorageController>().isAppUrlEmpty
          ? AppRouter.url
          : AppRouter.home,
      getPages: [
        GetPage(name: AppRouter.home, page: () => const HomeScreen()),
        GetPage(name: AppRouter.board, page: () => const BoardScreen()),
        GetPage(name: AppRouter.settings, page: () => const SettingsScreen()),
        GetPage(name: AppRouter.loading, page: () => const LoadingScreen()),
        GetPage(name: AppRouter.url, page: () => const UrlScreen()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/core_exports.dart';
import 'feature/presentation/screens/screens_export.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocalization(),
      locale: AppLocales.defaultLocale,
      fallbackLocale: AppLocales.fallbackLocale,
      initialBinding: AppBindings(),
      theme: LightTheme.value,
      darkTheme: DarkTheme.value,
      themeMode: ThemeMode.system,
      initialRoute: AppRouter.initial,
      getPages: [
        GetPage(name: AppRouter.home, page: () => const HomeScreen()),
        GetPage(name: AppRouter.board, page: () => const BoardScreen()),
        GetPage(name: AppRouter.settings, page: () => const SettingsScreen()),
        GetPage(name: AppRouter.url, page: () => const UrlScreen()),
        GetPage(name: AppRouter.initial, page: () => const InitialScreen()),
        GetPage(name: AppRouter.list, page: () => const ListScreen()),
      ],
    );
  }
}

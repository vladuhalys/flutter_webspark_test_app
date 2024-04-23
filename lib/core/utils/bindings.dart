import 'package:flutter_webspark_test_app/core/localization/controller/localization_controller.dart';
import 'package:flutter_webspark_test_app/core/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalizationController>(() => LocalizationController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
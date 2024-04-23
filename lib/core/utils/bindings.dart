import 'package:flutter_webspark_test_app/core/localization/controller/localization_controller.dart';
import 'package:flutter_webspark_test_app/core/theme/controller/theme_controller.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/data/source/remote/dio_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/url/validation/url_validation_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalizationController>(() => LocalizationController());
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<DioController>(() => DioController());
    Get.lazyPut<UrlValidationController>(() => UrlValidationController());
    Get.lazyPut<LocalStorageController>(() => LocalStorageController());
  }
}

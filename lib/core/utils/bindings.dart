import 'package:flutter_webspark_test_app/core/localization/controller/localization_controller.dart';
import 'package:flutter_webspark_test_app/core/theme/controller/theme_controller.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/data/source/remote/dio_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/list/list_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/url/validation/url_validation_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/bottom_bar/custom_bottom_bar_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalizationController>(() => LocalizationController(),
        fenix: true);
    Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
    Get.lazyPut<DioController>(() => DioController(), fenix: true);
    Get.lazyPut<UrlValidationController>(() => UrlValidationController(),
        fenix: true);
    Get.lazyPut<LocalStorageController>(() => LocalStorageController(),
        fenix: true);
    Get.lazyPut<CustomBottomBarController>(() => CustomBottomBarController(),
        fenix: true);
    Get.lazyPut<ListController>(() => ListController(), fenix: true);
  }
}

import 'package:flutter_webspark_test_app/core/core_exports.dart';
import 'package:get/get.dart';

class UrlValidationController extends GetxController {
  var url = ''.obs;
  var isValidUrl = false.obs;
  var errorText = ''.obs;

  void validateUrl(String value) {
    if (value.trim().isNullOrEmpty()) {
      isValidUrl.value = false;
      errorText.value = LangKeys.requiredUrl;
    } else if (GetUtils.isURL(value)) {
      isValidUrl.value = true;
      errorText.value = '';
    } else {
      isValidUrl.value = false;
      errorText.value = LangKeys.invalidUrl;
    }
    update();
  }
}

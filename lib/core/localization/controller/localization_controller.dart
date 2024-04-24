import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/locale.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  final _locale = Get.deviceLocale?.obs ?? const Locale('uk', 'UK').obs;

  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _locale.value = AppLocales.defaultLocale;
  }

  void setLocale(Locale locale) {
    _locale.value = locale;
  }

  Locale getLocale() {
    return _locale.value;
  }

  Locale getFallbackLocale() {
    return AppLocales.fallbackLocale;
  }

  Locale getUkrLocale() {
    return AppLocales.ukrLocale;
  }

  Locale getEngLocale() {
    return AppLocales.engLocale;
  }

  void setUkrLocale() {
    _locale.value = AppLocales.ukrLocale;
    Get.updateLocale(_locale.value);
    update();
  }

  void setEngLocale() {
    _locale.value = AppLocales.engLocale;
    Get.updateLocale(_locale.value);
    update();
  }

  void setDefaultLocale() {
    _locale.value = AppLocales.defaultLocale;
    Get.updateLocale(_locale.value);
    update();
  }

  void changeLocale() {
    _locale.value == AppLocales.ukrLocale ? setEngLocale() : setUkrLocale();
    update();
  }
}

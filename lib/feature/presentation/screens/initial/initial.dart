import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/extensions/extensions.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/home/home_screen.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/url/url_screen.dart';
import 'package:get/get.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalStorageController>(builder: (controller) {
      return (controller.appUrl.value.isNullOrEmpty())
          ? const UrlScreen()
          : const HomeScreen();
    });
  }
}

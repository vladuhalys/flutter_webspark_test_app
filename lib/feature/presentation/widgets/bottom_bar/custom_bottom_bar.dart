import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'custom_bottom_bar_controller.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(builder: (controller) {
      return SalomonBottomBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.changeIndex(index),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: Text(LangKeys.home.tr),
            selectedColor: Colors.purple,
          ),

          /// List
          SalomonBottomBarItem(
            icon: const Icon(Icons.list),
            title: Text(LangKeys.list.tr),
            selectedColor: Colors.pink,
          ),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/controller/localization_controller.dart';
import 'package:flutter_webspark_test_app/core/theme/controller/theme_controller.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title})
      : preferredSize = const Size.fromHeight(56.0);

  final String title;

  @override
  final Size preferredSize; // default is 56.0

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title.tr),
      centerTitle: true,
      actions: [
        GetBuilder<LocalizationController>(
          builder: (controller) {
            return TextButton(
              onPressed: () {
                controller.changeLocale();
              },
              child: Text(
                controller.locale.languageCode.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        GetBuilder<ThemeController>(
          builder: (controller) => IconButton(
            icon: Icon(
                controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).iconTheme.color),
            onPressed: () {
              controller.changeTheme();
              Get.appUpdate();
            },
          ),
        ),
      ],
    );
  }
}

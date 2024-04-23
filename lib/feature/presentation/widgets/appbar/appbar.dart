import 'package:flutter/material.dart';
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
      title: Text(widget.title),
      centerTitle: true,
      actions: [
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

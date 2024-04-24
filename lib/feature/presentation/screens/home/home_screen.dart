import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/core_exports.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/screens_export.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/widgets_export.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalStorageController>(
      builder: (controller) {
        controller.getData();
        return GetBuilder<CustomBottomBarController>(
          builder: (bottomBarController) {
            return Scaffold(
              appBar: const CustomAppBar(title: LangKeys.screenHomeTitle),
              body: SafeArea(
                child: _switchWidget(bottomBarController.currentIndex.value),
              ),
              bottomNavigationBar: const CustomBottomBar(),
            );
          },
        );
      },
    );
  }
}

Widget _switchWidget(int value) {
  switch (value) {
    case 0:
      return const HomeBody();
    case 1:
      return const ListScreen();
    case 2:
      return const BoardScreen();
    default:
      return const HomeBody();
  }
}

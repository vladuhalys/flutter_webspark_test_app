import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/core/router/app_router.dart';
import 'package:flutter_webspark_test_app/core/theme/colors/dark_colors.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/appbar/appbar.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalStorageController>(builder: (controller) {
      controller.getData();
      return Scaffold(
        appBar: const CustomAppBar(title: LangKeys.screenHomeTitle),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${LangKeys.appUrl.tr}: ${controller.appUrl.value}',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRouter.url);
                },
                child: Text(LangKeys.changeUrl.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppDarkColors.textColor,
                        )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomBar(),
      );
    });
  }
}

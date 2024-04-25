import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/core/router/app_router.dart';
import 'package:flutter_webspark_test_app/core/theme/colors/dark_colors.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/data/source/remote/dio_controller.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<DioController>().get();
    return GetBuilder<LocalStorageController>(
      builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${LangKeys.appUrl.tr}: ${controller.appUrl.value}',
                textAlign: TextAlign.center,
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
        );
      },
    );
  }
}

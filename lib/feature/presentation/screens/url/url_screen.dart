import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/core/router/router_exports.dart';
import 'package:flutter_webspark_test_app/core/theme/colors/dark_colors.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/url/validation/url_validation_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/appbar/appbar.dart';
import 'package:get/get.dart';

class UrlScreen extends StatelessWidget {
  const UrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: LangKeys.screenUrlTitle),
      body: GetBuilder<UrlValidationController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  controller.validateUrl(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  hintText: LangKeys.hintEnterUrl.tr,
                  hintStyle: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  controller.errorText.value.tr,
                  style: TextStyle(
                    color:
                        controller.isValidUrl.value ? Colors.green : Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    controller.validateUrl(controller.url.value);
                    if (controller.isValidUrl.value == true) {
                      Get.find<LocalStorageController>()
                          .saveData(controller.url.value);
                      Get.snackbar(
                        LangKeys.snackbarSuccess.tr,
                        LangKeys.snackbarUrlSaved.tr,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      Get.offNamed(AppRouter.home);
                    }
                  },
                  child: Text(LangKeys.setUrl.tr,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppDarkColors.textColor,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

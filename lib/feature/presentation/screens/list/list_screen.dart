import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/router/router_exports.dart';
import 'package:flutter_webspark_test_app/feature/data/source/remote/dio_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/list/list_controller.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListController>(
      builder: (controller) {
        return (Get.find<DioController>().isLoading.value == true)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.listPath.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.selectIndex(index);
                      Get.toNamed(AppRouter.board);
                    },
                    title: Center(
                        child: Text(
                      controller.listPath[index].initPath,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                  );
                },
              );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/core_exports.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/widgets/board_widget.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/list/list_controller.dart';
import 'package:get/get.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(LangKeys.screenBoardTitle.tr),
        ),
        body: GetBuilder<ListController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    controller.getSelectedPath().initPath,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Expanded(
                  child: BoardWidget(),
                ),
                const SizedBox(height: 5),
                (controller.getSelectedPath().path.isNotEmpty)
                    ? Text(
                        '${LangKeys.path.tr}: ${controller.getSelectedPath().finalPath}')
                    : Container(),
                const SizedBox(height: 25),
                (controller.getSelectedPath().path.isNotEmpty)
                    ? ElevatedButton(
                        onPressed: () {
                          controller.sendToServer();
                        },
                        child: Text(
                          LangKeys.pathToServer.tr,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppDarkColors.textColor,
                                  ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller.calculatePathPoint();
                        },
                        child: Text(
                          LangKeys.calculate.tr,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppDarkColors.textColor,
                                  ),
                        ),
                      ),
                const SizedBox(height: 25),
              ],
            );
          },
        ),
      ),
    );
  }
}

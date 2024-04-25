import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/widgets/card_widget.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/list/list_controller.dart';
import 'package:get/get.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListController>(builder: (controller) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: controller.getSelectedPath().cols,
        ),
        itemCount: controller.allPoints(controller.selectedIndex.value).length,
        itemBuilder: (context, index) {
          return CardWidget(
            point: controller.allPoints(controller.selectedIndex.value)[index],
          );
        },
      );
    });
  }
}

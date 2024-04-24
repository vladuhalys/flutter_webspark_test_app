import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/board_controllers/board_controller.dart';
import 'package:get/get.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoardController>(builder: (controller) {
      return GridView.count(
        crossAxisCount: (controller.boardSize.value > 1)
            ? sqrt(controller.boardSize.value).ceil()
            : controller.boardSize.value,
        children: List.generate(
          controller.boardSize.value,
          (index) {
            return Container(
              margin: const EdgeInsets.all(1),
              color: index % 2 == 0 ? Colors.black : Colors.white,
            );
          },
        ),
      );
    });
  }
}

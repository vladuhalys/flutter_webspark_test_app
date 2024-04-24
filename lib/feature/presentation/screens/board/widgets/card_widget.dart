import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/domain/entities/points_entity.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/board_controllers/board_controller.dart';
import 'package:get/get.dart';

enum CardType { start, end, block, normal }

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.point});

  final PointEntity point;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(1),
        color: _getColor(Get.find<BoardController>().currentSelectedType.value),
        child: Center(
          child: Text(
            point.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

Color _getColor(CardType type) {
  switch (type) {
    case CardType.start:
      return Colors.lightGreen;
    case CardType.end:
      return Colors.indigo;
    case CardType.block:
      return Colors.grey;
    case CardType.normal:
      return Colors.white;
  }
}

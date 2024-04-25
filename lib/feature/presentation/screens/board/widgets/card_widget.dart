import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/domain/entities/path_entity.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/list/list_controller.dart';
import 'package:get/get.dart';

enum CardType { start, end, block, normal, path }

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.point});

  final Point point;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      color: _getColor(point),
      child: Center(
        child: Text(
          '(${point.x}, ${point.y})',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

Color _getColor(Point point) {
  PathEntity pointsPath = Get.find<ListController>().getSelectedPath();
  if (point == pointsPath.start) {
    return Colors.lightGreen;
  } else if (point == pointsPath.end) {
    return Colors.red;
  } else if (pointsPath.block.contains(point)) {
    return Colors.grey;
  } else if (pointsPath.path.contains(point)) {
    return Colors.cyan;
  } else {
    return Colors.white;
  }
}

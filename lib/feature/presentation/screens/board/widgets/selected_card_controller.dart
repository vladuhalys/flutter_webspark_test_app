import 'package:flutter_webspark_test_app/feature/domain/entities/points_entity.dart';
import 'package:get/get.dart';

class SelectedCardController extends GetxController {
  final isSelectStartPoint = false.obs;
  final isSelectEndPoint = false.obs;
  final startPoint = const PointEntity(0, 0).obs;
  final endPoint = const PointEntity(0, 0).obs;

  List<PointEntity> listBlock = [];

  void selectStartPoint(PointEntity point) {
    startPoint.value = point;
    isSelectStartPoint.value = true;
    update();
  }

  void selectEndPoint(PointEntity point) {
    endPoint.value = point;
    isSelectEndPoint.value = true;
    update();
  }

  void addBlock(PointEntity point) {
    listBlock.add(point);
    update();
  }

}
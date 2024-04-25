import 'dart:math';
import 'package:flutter_webspark_test_app/feature/data/source/remote/dio_controller.dart';
import 'package:flutter_webspark_test_app/feature/domain/domain_exports.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  List<PathEntity> listPath = [];

  final selectedIndex = 0.obs;

  String getBlockPointsInString(int index) {
    return listPath[index].block.join('\n');
  }

  void selectIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  PathEntity getSelectedPath() {
    return listPath[selectedIndex.value];
  }

  List<Point> allPoints(int index) {
    return listPath[index].allPoints;
  }

  void sendToServer() async {
    await Get.find<DioController>().post(listPath[selectedIndex.value]);
    update();
  }

  void calculatePathPoint() async {
    PathEntity pathEntity = getSelectedPath();
    listPath[selectedIndex.value].path.addAll(getPathPoints(pathEntity));
    listPath[selectedIndex.value].finalPath =
        getFinalPath(listPath[selectedIndex.value]);
    
    update();
  }
}

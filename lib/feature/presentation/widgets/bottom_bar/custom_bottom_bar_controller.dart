import 'package:get/get.dart';

class CustomBottomBarController extends GetxController {
  final currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }
}

import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  final boardSize = 0.obs;
  final isValid = false.obs;
  final errorMessage = ''.obs;

  void setBoardSize(int size) {
    boardSize.value = size;
    update();
  }

  void validateSize() {
    if (boardSize.value < 1 || boardSize.value > 100) {
      isValid.value = false;
      errorMessage.value = LangKeys.invalidBoardSize;
    } else {
      isValid.value = true;
      errorMessage.value = '';
    }
    update();
  }
}

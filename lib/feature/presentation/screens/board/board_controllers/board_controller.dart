import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/widgets/card_widget.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  final boardSize = 0.obs;
  final isValid = false.obs;
  final errorMessage = ''.obs;
  final currentSelectedType = CardType.normal.obs;

  void setBoardSize(int size) {
    boardSize.value = size;
    update();
  }

  void changeSelectedType(CardType type) {
    currentSelectedType.value = type;
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

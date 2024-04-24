import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/board_controllers/board_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/widgets/card_widget.dart';
import 'package:get/get.dart';

import 'selected_card_controller.dart';

class CardTypeItem extends StatelessWidget {
  const CardTypeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectedCardController>(
      builder: (controller) {
        return AnimatedFloatingActionButton(
            //Fab list
            fabButtons: <Widget>[
              startBtn(),
              endBtn(),
              blockBtn(),
            ],
            key: key,
            colorStartAnimation: Colors.blue,
            colorEndAnimation: Colors.red,
            animatedIconData: AnimatedIcons.menu_close //To principal button
            );
      },
    );
  }
}

Widget startBtn() {
  return FloatingActionButton(
    onPressed: () {
      Get.find<BoardController>().changeSelectedType(CardType.start);
    },
    heroTag: "start",
    tooltip: 'Start button',
    backgroundColor: Colors.lightGreen,
    child: const Icon(Icons.start),
  );
}

Widget endBtn() {
  return FloatingActionButton(
    onPressed: () {
      Get.find<BoardController>().changeSelectedType(CardType.end);
    },
    heroTag: "End",
    tooltip: 'End button',
    backgroundColor: Colors.indigo,
    child: const Icon(Icons.pin_end),
  );
}

Widget blockBtn() {
  return FloatingActionButton(
    onPressed: () {
      Get.find<BoardController>().changeSelectedType(CardType.block);
    },
    heroTag: "Block",
    tooltip: 'Block button',
    backgroundColor: Colors.grey,
    child: const Icon(Icons.block),
  );
}

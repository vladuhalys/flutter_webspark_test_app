import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/board/widgets/board_widget.dart';
import 'package:get/get.dart';

import 'board_controllers/board_controller.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoardController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value) {
                controller.setBoardSize(int.tryParse(value) ?? 0);
                controller.validateSize();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: LangKeys.hintEnterBoardSize.tr,
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              controller.errorMessage.value.tr,
              style: TextStyle(
                color: controller.isValid.value ? Colors.green : Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              controller.currentSelectedType.value.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (controller.isValid.value)
            const Expanded(
              child: BoardWidget(),
            ),
        ],
      );
    });
  }
}

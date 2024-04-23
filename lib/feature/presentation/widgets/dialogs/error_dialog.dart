import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/core_exports.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {super.key, required this.errorText, required this.errorTitel});

  final String errorTitel;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(errorTitel.tr),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('${LangKeys.dialogDescription.tr}$errorText'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(LangKeys.dialogAprove.tr),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}

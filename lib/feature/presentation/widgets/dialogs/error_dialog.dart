import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/core/core_exports.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {super.key, required this.errorText, required this.errorTitel});

  final String errorTitel;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAssetsConst.errorAnimation),
          Text(
            errorTitel.tr,
          ),
          Text('${LangKeys.dialogDescription.tr} $errorText'),
        ],
      )),
    );
  }
}

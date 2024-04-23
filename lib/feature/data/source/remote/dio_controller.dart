import 'package:dio/dio.dart';
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/dialogs/error_dialog.dart';
import 'package:get/get.dart';

class DioController extends GetxController {
  final dio = Dio();

  Future<void> get(String url) async {
    try {
      final response = await dio.get(url);
      Get.dialog(ErrorDialog(
          errorTitel: "My titel", errorText: 'Response: ${response.data}'));
    } catch (e) {
      Get.dialog(ErrorDialog(
          errorTitel: LangKeys.connectionError, errorText: e.toString()));
    }
  }
}

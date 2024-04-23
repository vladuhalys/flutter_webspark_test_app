import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_webspark_test_app/core/core_exports.dart';
import 'package:get/get.dart';

class LocalStorageController extends GetxController {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  var appUrl = ''.obs;

  bool get isAppUrlEmpty => appUrl.value.isNullOrEmpty();

  Future<void> saveData(dynamic data,
      [String key = AppConsts.appUrlKey]) async {
    await storage.write(key: key, value: data);
  }

  Future<void> getData([String key = AppConsts.appUrlKey]) async {
    appUrl.value = await storage.read(key: key) ?? '';
    update();
  }

  Future<void> removeData([String key = AppConsts.appUrlKey]) async {
    await storage.delete(key: key);
  }
}

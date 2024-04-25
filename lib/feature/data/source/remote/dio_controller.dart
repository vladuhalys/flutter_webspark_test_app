import 'package:dio/dio.dart' as d;
import 'package:flutter_webspark_test_app/core/localization/keys/keys.dart';
import 'package:flutter_webspark_test_app/feature/data/models/path_model.dart';
import 'package:flutter_webspark_test_app/feature/data/source/local/local_storge_controller.dart';
import 'package:flutter_webspark_test_app/feature/domain/entities/path_entity.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/list/list_controller.dart';
import 'package:flutter_webspark_test_app/feature/presentation/widgets/dialogs/error_dialog.dart';
import 'package:get/get.dart';

class DioController extends GetxController {
  final dio = d.Dio(
    d.BaseOptions(
        baseUrl: Get.find<LocalStorageController>().appUrl.value,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        responseType: d.ResponseType.json),
  );

  var isLoading = false.obs;

  void setLoading(bool value) {
    if (isLoading.value != value) {
      isLoading.value = value;
      update();
    }
  }

  Future<void> get() async {
    String url = Get.find<LocalStorageController>().appUrl.value;
    try {
      var response = await dio.get(url, onReceiveProgress: (received, total) {
        setLoading(true);
      });
      var data = response.data['data'];
      List<PathModel> listPath = [];
      for (var element in data) {
        listPath.add(PathModel.fromJson(element));
      }
      List<PathEntity> listPathEntity = [];
      for (var element in listPath) {
        listPathEntity.add(PathEntity.fromModel(element));
      }
      Get.find<ListController>().listPath = listPathEntity;
      setLoading(false);
    } catch (e) {
      Get.dialog(ErrorDialog(
          errorTitel: LangKeys.connectionError, errorText: e.toString()));
    }
  }

  Future<void> post(PathEntity pathEntity) async {
    String url = Get.find<LocalStorageController>().appUrl.value;
    try {
      d.FormData formData = d.FormData.fromMap({
        '"id"': '"${pathEntity.id}"',
        '"result"': {
          '"steps"': {
            pathEntity.path
                .map((point) => {'"x"': '"${point.x}"', '"y"': '"${point.y}"'})
                .toList()
          },
          '"path"': '"${getFinalPath(pathEntity)}"',
        },
      });
      await dio.put(url,
          data: formData, options: d.Options(contentType: 'application/json'));
      Get.snackbar('Success', 'Data sent successfully');
    } catch (e) {
      Get.dialog(ErrorDialog(
          errorTitel: LangKeys.connectionError, errorText: e.toString()));
    }
  }
}

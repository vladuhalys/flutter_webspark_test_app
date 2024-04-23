import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/data/source/remote/dio_controller.dart';
import 'package:get/get.dart';

class UrlScreen extends StatelessWidget {
  const UrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.find<DioController>().get('https://');
          },
          child: const Text('Open Home Screen'),
        ),
      ),
    );
  }
}

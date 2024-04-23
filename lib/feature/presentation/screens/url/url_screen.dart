import 'package:flutter/material.dart';
import 'package:flutter_webspark_test_app/feature/presentation/screens/url/validation/url_validation_controller.dart';
import 'package:get/get.dart';

class UrlScreen extends StatelessWidget {
  const UrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Url Screen'),
      ),
      body: GetBuilder<UrlValidationController>(
        builder: (controller) => Column(
          children: [
            TextField(
              onChanged: (value) {
                controller.validateUrl(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter Url',
                errorText: controller.errorText.value.tr,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

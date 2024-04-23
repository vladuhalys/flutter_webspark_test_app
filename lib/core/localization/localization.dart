import 'package:get/get.dart';

import 'keys/english.dart';
import 'keys/ukrainian.dart';

class AppLocalization extends Translations {
  static const List<String> languages = ['en_US', 'uk_UK'];
  @override
  Map<String, Map<String, String>> get keys => {
        languages[0]: English.values,
        languages[1]: Ukrainian.values,
      };
}

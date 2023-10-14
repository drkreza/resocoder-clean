import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "hi": "hello",
          "title": "test",
        },
        'fa_IR': {
          "hi": "سلام",
          "title": "تست",
        }
      };
}

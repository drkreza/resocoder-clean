import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "hi": "hello",
          "title": "test",
          "desc":"this is a test text"
        },
        'fa_IR': {
          "hi": "سلام",
          "title": "تست",
           "desc":"این یک متن تستی است"
        }
      };
}

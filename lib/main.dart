import 'package:clean_reso_coder_implementation/core/localization/translations.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/pages/another_page.dart';
import 'package:clean_reso_coder_implementation/test/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'feature/numbertrivia/presentation/pages/number_trivia_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('en', 'US'),
      title: 'Number Trivia',
      // home: NumberTriviaPage(),
      // home: MyWidget(),
      home: AnotherPage(),
    );
  }
}

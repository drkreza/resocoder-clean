import 'dart:convert';

import 'package:clean_reso_coder_implementation/core/localization/translations.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/theme/theme_cubit.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/pages/another_page.dart';
import 'package:clean_reso_coder_implementation/test/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'feature/numbertrivia/presentation/pages/number_trivia_page.dart';
import 'injection_container.dart' as di;

import 'dart:typed_data';
import 'package:pointycastle/export.dart';

import 'my_encoder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return GetMaterialApp(
            translations: MyTranslations(),
            locale: const Locale('fa', 'IR'),
            fallbackLocale: const Locale('en', 'US'),
            title: 'Number Trivia',
            theme: state,
            // home: NumberTriviaPage(),
            // home: MyWidget(),
            // home: AnotherPage(),
            home: Center(
              child: ElevatedButton(
                onPressed: () {
                  RsaKeyHelper().generateKeyPairFromSeed();
                },
                child: Text('generate'),
              ),
            ),
          );
        },
      ),
    );
  }
}


/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            theme: theme,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
} */

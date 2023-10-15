import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final KColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(initialTheme);

  static final ThemeData initialTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: KColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: KColorScheme.onPrimaryContainer,
      foregroundColor: KColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
        color: KColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(16)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColorScheme.primaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          color: KColorScheme.onSecondaryContainer,
          fontSize: 14,
        )),
  );

  static final ThemeData darkTheme = ThemeData.dark();

  void toggleTheme() {
    print("calleddd");
    emit(state == initialTheme ? darkTheme : initialTheme);
  }
}

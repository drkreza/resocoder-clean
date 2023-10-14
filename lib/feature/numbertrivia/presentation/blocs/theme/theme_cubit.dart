import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(initialTheme);

  static final ThemeData initialTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark();

  void toggleTheme() {
    print("calleddd");
    emit(state == initialTheme ? darkTheme : initialTheme);
  }
}

import 'package:clean_reso_coder_implementation/widgets/bottom_navigation_bar/bottom_navigation_cubit.dart';
import 'package:clean_reso_coder_implementation/widgets/bottom_navigation_bar/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child:  const MyHomePageBottomNavigationBar(),
      ),
    );
  }
}

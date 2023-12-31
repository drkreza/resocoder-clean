import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/theme/theme_cubit.dart';
import 'package:clean_reso_coder_implementation/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('desc'.tr),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            child: const Text('change theme ')),
      ),
    );
  }
}

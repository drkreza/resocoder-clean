import 'package:clean_reso_coder_implementation/widgets/my_alert_dialog.dart';
import 'package:clean_reso_coder_implementation/widgets/my_card.dart';
import 'package:clean_reso_coder_implementation/widgets/my_chip_view_and_wrap.dart';
import 'package:clean_reso_coder_implementation/widgets/my_floating_action_button.dart';
import 'package:clean_reso_coder_implementation/widgets/my_image.dart';
import 'package:clean_reso_coder_implementation/widgets/my_material_button_snackbar.dart';
import 'package:clean_reso_coder_implementation/widgets/my_cloumns.dart';
import 'package:clean_reso_coder_implementation/widgets/my_rotated_box.dart';
import 'package:clean_reso_coder_implementation/widgets/my_spacer.dart';
import 'package:clean_reso_coder_implementation/widgets/my_stack.dart';
import 'package:clean_reso_coder_implementation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: MyFloadtingActionButton(),
      ),
    );
  }
}

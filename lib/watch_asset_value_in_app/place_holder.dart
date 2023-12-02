import 'package:clean_reso_coder_implementation/custom_dialog/custom_dialog.dart';

import 'place_holder_cubit.dart';
import 'test_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../injection_container.dart';

class MyTestPlaceHolder extends StatelessWidget {
  MyTestPlaceHolder({super.key});

  final bloccc = sl<PlaceHolderCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PlaceHolderCubit, String?>(
        bloc: bloccc,
        listener: (context, state) {
          if (state == 'reza') {
            // Get.closeAllSnackbars();
            // Get.showSnackbar(const GetSnackBar(message: 'hello reza',));
            // ScaffoldMessenger.of(context).clearSnackBars();
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('hello reza')));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Your Snackbar Message'),
              ),
            );
            // Ensure that this code is executed when the state is 'reza'
            print(
                'Showing Snackbar: Your Snackbar Messageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      bloccc.saveObject("reza");
                    },
                    child: const Text('save value')),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      print(bloccc.state);
                    },
                    child: const Text('print value')),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      showCustomDialog(context);
                      // Get.to(()=>TestCubitPage());
                      // Navigate to another page
                    /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestCubitPage())); */
                    },
                    child: const Text('go to another page')),
              ],
            ),
          );
        },
      ),
    );
  }
}

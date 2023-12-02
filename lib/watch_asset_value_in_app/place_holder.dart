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
      body: BlocBuilder<PlaceHolderCubit, String?>(
        bloc: bloccc,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      bloccc.saveObject("reza");
                    }, child: const Text('save value')),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      print(bloccc.state);
                    }, child: const Text('print value')),
                     const SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: (){
                  Get.to(TestCubitPage());
                }, child: Text('go to another page')),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:clean_reso_coder_implementation/watch_asset_value_in_app/place_holder_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';


class TestCubitPage extends StatelessWidget {
  TestCubitPage({super.key});

  final myCubit = sl<PlaceHolderCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PlaceHolderCubit, String?>(
          bloc: myCubit,
          builder: (context, state) {
            return Text(myCubit.state??"mio");
          },
        ),
      ),
    );
  }
}

import 'bottom_navigation_cubit.dart';
import 'my_bottomnavigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePageBottomNavigationBar extends StatelessWidget {
  const MyHomePageBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Example'),
      ),
      body: Center(
        child: BlocBuilder<BottomNavigationCubit, int>(
          builder: (context, state) {
            return Text('Page $state');
          },
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}



//'Page ${context.select((BottomNavigationCubit cubit) => cubit.state)}'

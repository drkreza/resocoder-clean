import 'package:clean_reso_coder_implementation/widgets/bottom_navigation_bar/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavCubit =
        context.read<BottomNavigationCubit>(); // Access the Cubit

    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, selectedIndex) {
        return BottomNavigationBar(
          currentIndex: selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            bottomNavCubit.updateIndex(index);
            switch (index) {
              case 1:
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('hello')));
                break;
              case 2:
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('hi')));
              default:
            }
          },
        );
      },
    );
  }
}

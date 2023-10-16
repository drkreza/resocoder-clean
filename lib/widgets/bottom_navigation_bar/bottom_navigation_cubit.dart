import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0); // Set the initial index to 0

  void updateIndex(int newIndex) {
    emit(newIndex);
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  Future<void> increment() async{
    emit(CounterLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(const CounterLoaded(counter: 5));
  }


}

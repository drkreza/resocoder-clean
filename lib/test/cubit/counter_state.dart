part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {
  const CounterInitial();
}

final class CounterLoading extends CounterState {
  const CounterLoading();
}

final class CounterLoaded extends CounterState {
  final int counter;

  const CounterLoaded({required this.counter});

  @override
  List<Object> get props => [counter];
}

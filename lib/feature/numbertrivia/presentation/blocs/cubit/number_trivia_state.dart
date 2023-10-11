part of 'number_trivia_cubit.dart';

sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

final class NumberTriviaInitial extends NumberTriviaState {
  const NumberTriviaInitial();
}

final class NumberTriviaLoading extends NumberTriviaState {
  const NumberTriviaLoading();
}

final class NumberTriviaLoaded extends NumberTriviaState {
  final NumberTriviaEntity trivia;

  const NumberTriviaLoaded({required this.trivia});
}

final class NumberTriviaError extends NumberTriviaState {
  final String message;

  const NumberTriviaError({required this.message});
}

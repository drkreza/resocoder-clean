part of 'number_trivia_cubit.dart';

 sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

 class NumberTriviaInitial extends NumberTriviaState {
  const NumberTriviaInitial();
}

 class NumberTriviaLoading extends NumberTriviaState {
  const NumberTriviaLoading();
}

 class NumberTriviaLoaded extends NumberTriviaState {
  final NumberTriviaEntity trivia;

  const NumberTriviaLoaded({required this.trivia});

  @override
  List<Object> get props => [trivia.number,trivia.text];
}

 class NumberTriviaError extends NumberTriviaState {
  final String message;

  const NumberTriviaError({required this.message});

  @override
  List<Object> get props => [message];
}


 class Empty extends NumberTriviaState {}

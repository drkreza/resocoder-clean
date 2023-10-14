import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/input_converter.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/number_trivia.dart';
import '../../../domain/usecases/get_concrete_number_trivia.dart';
import '../../../domain/usecases/get_random_number_trivia.dart';
import 'number_trivia_cubit.dart';
import 'number_trivia_event.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTriviaUseCase getConcreteNumberTrivia;
  final GetRandomNumberTriviaUseCase getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required GetConcreteNumberTriviaUseCase concrete,
    required GetRandomNumberTriviaUseCase random,
    required this.inputConverter,
  })  : assert(concrete != null),
        assert(random != null),
        assert(inputConverter != null),
        getConcreteNumberTrivia = concrete,
        getRandomNumberTrivia = random,
        super(Empty()) {
    on<GetTriviaForConcreteNumber>((event, emit)  {
      /* final inputEither =
          inputConverter.stringsToUnsignedInteger(event.numberString);
       inputEither.fold(
        (failure) async* {
          yield const NumberTriviaError(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (integer) async* {
          yield const NumberTriviaLoading();
          final failureOrTrivia =
              await getConcreteNumberTrivia(Params(number: integer));
          yield* _eitherLoadedOrErrorState(failureOrTrivia);
        },
      ); */
    });
    on<GetTriviaForRandomNumber>((event, emit) async{
       emit(NumberTriviaLoading()) ;
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());
      failureOrTrivia.fold(
      (failure) => emit(NumberTriviaError(message: _mapFailureToMessage(failure))),
      (trivia) => emit(NumberTriviaLoaded(trivia: trivia)),
    );
    });
  }

  /* @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    if (event is GetTriviaForConcreteNumber) {
      final inputEither =
          inputConverter.stringsToUnsignedInteger(event.numberString);

      yield* inputEither.fold(
        (failure) async* {
          yield const NumberTriviaError(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (integer) async* {
          yield const NumberTriviaLoading();
          final failureOrTrivia =
              await getConcreteNumberTrivia(Params(number: integer));
          yield* _eitherLoadedOrErrorState(failureOrTrivia);
        },
      );
    } else if (event is GetTriviaForRandomNumber) {
      yield const NumberTriviaLoading();
      final failureOrTrivia = await getRandomNumberTrivia(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    }
  }
 */
  Stream<NumberTriviaState> _eitherLoadedOrErrorState(
    Either<Failure, NumberTriviaEntity> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => NumberTriviaError(message: _mapFailureToMessage(failure)),
      (trivia) => NumberTriviaLoaded(trivia: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}

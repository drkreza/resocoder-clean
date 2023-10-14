import 'package:bloc/bloc.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/utils/input_converter.dart';
import '../../../domain/entities/number_trivia.dart';
import '../../../domain/usecases/get_concrete_number_trivia.dart';
import '../../../domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'number_trivia_state.dart';

const INVALID_INPUT_FAILURE_MESSAGE = 'invalid input ';
const SERVER_FAILURE_MESSAGE = 'a problem accured please try again later';

class NumberTriviaCubit extends Cubit<NumberTriviaState> {
  final InputConverter inputConverter;
  final GetConcreteNumberTriviaUseCase concrete;
  final GetRandomNumberTriviaUseCase random;
  NumberTriviaCubit(
      {required this.inputConverter,
      required this.concrete,
      required this.random})
      : super(const NumberTriviaInitial());

  Future<void> getTriviaForConcreteNumber(String number) async {
    emit(const NumberTriviaLoading());
    Either<Failure, int> inputEither =
        inputConverter.stringsToUnsignedInteger(number);

    inputEither.fold((failure) {
      emit(const NumberTriviaError(message: INVALID_INPUT_FAILURE_MESSAGE));
    }, (integer) async {
      final failureOrTrivia = await concrete.call(Params(number: integer));
      failureOrTrivia.fold((failure) {
        emit(const NumberTriviaError(message: SERVER_FAILURE_MESSAGE));
      }, (trivia) {
        emit(NumberTriviaLoaded(trivia: trivia));
      });
    });
  }

  Future<void> getTriviaForRandomNumber() async {
   /*  print("1");
    emit(const NumberTriviaLoading());
    print("2");
    await Future.delayed(Duration(seconds: 4));
    print("3");
    emit(NumberTriviaLoaded(trivia: NumberTriviaEntity(number: 2, text: "Reza")) );
    print("4"); */
     emit(const NumberTriviaLoading());
    final failureOrTrivia = await random.call(NoParams());
    failureOrTrivia.fold(
      (failure) {
      emit(const NumberTriviaError(message: SERVER_FAILURE_MESSAGE));
    },(trivia) {
      emit(NumberTriviaLoaded(trivia: trivia));
    }); 
  }

}

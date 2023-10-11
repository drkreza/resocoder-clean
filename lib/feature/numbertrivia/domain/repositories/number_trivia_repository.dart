import '../../../../core/errors/failures.dart';
import '../entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumbertrivia(int number);
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia();
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTriviaUseCase implements UseCase<NumberTriviaEntity, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTriviaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NumberTriviaEntity>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

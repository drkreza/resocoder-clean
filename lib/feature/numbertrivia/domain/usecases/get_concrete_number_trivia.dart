import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTriviaUseCase implements UseCase<NumberTriviaEntity, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTriviaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NumberTriviaEntity>> call(Params params) async {
    return await repository.getConcreteNumbertrivia(params.number);
  }

/*   Future<Either<Failure, NumberTriviaEntity>> call( {required int number}) async {
    return await repository.getConcreteNumbertrivia(number);
  } */
}

class Params extends Equatable {
  final int number;
  const Params({
    required this.number,
  });

  @override
  List<Object?> get props => [number];
}

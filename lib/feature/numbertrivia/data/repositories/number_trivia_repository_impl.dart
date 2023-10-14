import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';
import '../datasources/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumbertrivia(
      int number) async {
    if (await networkInfo.isConnected) {
      try {
        final numberTrivia =
            await remoteDataSource.getConcreteNumberTrivia(number);
        return Right(numberTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia() async {
    try {
      final randomTrivia = await remoteDataSource.getRandomNumberTrivia();
      return Right(randomTrivia);
    } on ServerException {
      print("ServerException");
      return Left(ServerFailure());
    }on JsonParserException{
      print("JsonParserException");
      return Left(ServerFailure());
    }on Exception{
       return Left(ServerFailure());
    }
  }
}

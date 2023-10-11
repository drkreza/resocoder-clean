import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

//General Failures
class ServerFailure extends Failure {}

class NoInternetConnectionFailure extends Failure{}

// class CacheFailure implements Exception {}

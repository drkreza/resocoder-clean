import 'dart:convert';

import 'package:clean_reso_coder_implementation/core/errors/exceptions.dart';
import 'package:clean_reso_coder_implementation/core/log/logger_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart%20';
import 'package:http/http.dart' as http;

import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final response = await client.get(
      Uri.parse('http://numbersapi.com/$number'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response = await client.get(
      Uri.parse('http://numbersapi.com/random'),
      headers: {'Content-Type': 'application/json'},
    );
    try {
      if (response.statusCode == 200) {
         MyLog.log('MyError0', "code 200000000");
        return NumberTriviaModel.fromJson(json.decode(response.body));
      } else {
        // print('status : ' + response.statusCode.toString());
        MyLog.log('MyError0', response.statusCode.toString());
        throw ServerException();
      }
    } on ServerException {
      MyLog.log('MyError1', "server");
      throw ServerException();
    } on JsonParserException {
      MyLog.log('MyError2', "json");
      throw JsonParserException();
    } on Exception {
      MyLog.log('MyError3', "global");
      throw Exception();
    }
  }
}

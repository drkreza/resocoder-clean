import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'core/utils/input_converter.dart';
import 'feature/numbertrivia/data/datasources/number_trivia_remote_data_source.dart';
import 'feature/numbertrivia/data/repositories/number_trivia_repository_impl.dart';
import 'feature/numbertrivia/domain/repositories/number_trivia_repository.dart';
import 'feature/numbertrivia/domain/usecases/get_concrete_number_trivia.dart';
import 'feature/numbertrivia/domain/usecases/get_random_number_trivia.dart';
import 'feature/numbertrivia/presentation/blocs/cubit/number_trivia_cubit.dart';
import 'test/cubit/counter_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(
    () => NumberTriviaCubit(
      inputConverter: sl(),
      concrete: sl(),
      random: sl(),
    ),
  );

  sl.registerLazySingleton(() => CounterCubit());

  // Bloc
  /*  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ),
  ); */

  sl.registerLazySingleton(
      () => GetConcreteNumberTriviaUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => GetRandomNumberTriviaUseCase(repository: sl()));

  sl.registerLazySingleton(() => InputConverter());

  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());

  // sl.registerSingleton<NumberTriviaState>(NumberTriviaInitial());

  sl.registerLazySingleton(() => ThemeCubit());
}

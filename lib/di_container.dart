import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hmaserv/modules/movies/data/data_source/remote/movies_data_source.dart';
import 'package:hmaserv/modules/movies/data/repository_impl/movies_repository_impl.dart';
import 'package:hmaserv/modules/movies/domain/repositories/movies_repository.dart';
import 'package:hmaserv/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:hmaserv/modules/movies/domain/usecases/get_movies_usecase.dart';
import 'package:hmaserv/modules/movies/domain/usecases/search_movies_usecase.dart';
import 'package:hmaserv/modules/movies/presentation/cubits/movies/movies_cubit.dart';
import 'package:hmaserv/modules/movies/presentation/cubits/search/search_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/services/network/api_client.dart';
import 'core/services/network/dio_client.dart';
import 'core/services/network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // external
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<ApiClient>(() => DioClient(sl<Dio>(), sl<PrettyDioLogger>()));

  // Data sources
  sl.registerLazySingleton<MoviesDataSource>(() => MoviesDataSource(sl<ApiClient>()));

  // Repositories
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl<MoviesDataSource>(), sl<NetworkInfo>()));

  // Use cases
  sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl<MoviesRepository>()));
  sl.registerLazySingleton<GetMoviesUseCase>(() => GetMoviesUseCase(sl<MoviesRepository>()));
  sl.registerLazySingleton<SearchMoviesUseCase>(() => SearchMoviesUseCase(sl<MoviesRepository>()));

  // View models
  sl.registerFactory<MoviesCubit>(() => MoviesCubit(sl<GetMoviesUseCase>(), sl<GetMovieDetailsUseCase>()));
  sl.registerFactory<SearchCubit>(() => SearchCubit(sl<SearchMoviesUseCase>()));
}

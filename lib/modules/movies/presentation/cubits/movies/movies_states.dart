part of 'movies_cubit.dart';

abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class GetMoviesLoadingState extends MoviesStates {}

class GetMoviesSuccessState extends MoviesStates {}

class GetMoviesFailureState extends MoviesStates {
  final Failure failure;

  GetMoviesFailureState(this.failure);
}

class GetMovieDetailsLoadingState extends MoviesStates {}

class GetMovieDetailsSuccessState extends MoviesStates {}

class GetMovieDetailsFailureState extends MoviesStates {
  final Failure failure;

  GetMovieDetailsFailureState(this.failure);
}


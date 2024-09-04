import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_details_entity.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_entity.dart';

import 'package:hmaserv/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:hmaserv/modules/movies/domain/usecases/get_movies_usecase.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/error/failure.dart';

part 'movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  final GetMoviesUseCase _getMoviesUseCase;
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MoviesCubit(this._getMoviesUseCase, this._getMovieDetailsUseCase) : super(MoviesInitialState());

  final GlobalKey<SliverAnimatedListState> listKey = GlobalKey<SliverAnimatedListState>();
  List<Movie> movies = [];
  MovieDetails? movieDetails;

  Future<void> getMovies() async {
    emit(GetMoviesLoadingState());
    final result = await _getMoviesUseCase.execute();
    result.fold(
      (failure) => emit(GetMoviesFailureState(failure)),
      (movies) {
        emit(GetMoviesSuccessState());
        for (int i = 0; i < movies.length; i++) {
          Future.delayed(Duration(milliseconds: 100 * i), () {
            this.movies.add(movies[i]);
            listKey.currentState?.insertItem(this.movies.length - 1, duration: Time.t700ms);
          });
        }
      },
    );
  }

  Future<void> getMovieDetails(int id) async {
    movieDetails = null;
    emit(GetMovieDetailsLoadingState());
    final result = await _getMovieDetailsUseCase.execute(id);
    result.fold(
      (failure) => emit(GetMovieDetailsFailureState(failure)),
      (movieDetails) {
        this.movieDetails = movieDetails;
        emit(GetMovieDetailsSuccessState());
      },
    );
  }
}

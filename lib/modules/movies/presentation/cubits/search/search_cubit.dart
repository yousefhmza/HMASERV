import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hmaserv/core/services/error/failure.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_entity.dart';
import 'package:hmaserv/modules/movies/domain/usecases/search_movies_usecase.dart';

part 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  SearchCubit(this._searchMoviesUseCase) : super(SearchInitialState());

  List<Movie> movies = [];

  Future<void> searchMovies(String search) async {
    movies.clear();
    emit(SearchMoviesLoadingState());
    final result = await _searchMoviesUseCase.execute(search);
    result.fold(
      (failure) => emit(SearchMoviesFailureState(failure)),
      (movies) {
        this.movies = movies;
        emit(SearchMoviesSuccessState());
      },
    );
  }
}

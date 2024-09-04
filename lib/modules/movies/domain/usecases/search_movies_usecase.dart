import 'package:dartz/dartz.dart';

import '../../../../core/services/error/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/movies_repository.dart';

class SearchMoviesUseCase {
  final MoviesRepository _moviesRepository;

  SearchMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return _moviesRepository.searchMovie(query);
  }
}

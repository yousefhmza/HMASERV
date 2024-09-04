import 'package:dartz/dartz.dart';

import '../../../../core/services/error/failure.dart';
import '../entities/movie_entity.dart';
import '../repositories/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository _moviesRepository;

  GetMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _moviesRepository.getMovies();
  }
}

import 'package:dartz/dartz.dart';
import 'package:hmaserv/core/services/error/failure.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_details_entity.dart';
import 'package:hmaserv/modules/movies/domain/repositories/movies_repository.dart';

import '../entities/movie_entity.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository _moviesRepository;

  GetMovieDetailsUseCase(this._moviesRepository);

  Future<Either<Failure, MovieDetails>> execute(int id) {
    return _moviesRepository.getMovieDetails(id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:hmaserv/core/base/repositories/base_repository.dart';
import 'package:hmaserv/core/services/error/failure.dart';
import 'package:hmaserv/modules/movies/data/data_source/remote/movies_data_source.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_details_entity.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepository extends BaseRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepository(this.moviesDataSource, super.networkInfo);

  Future<Either<Failure, List<Movie>>> getMovies();

  Future<Either<Failure, List<Movie>>> searchMovie(String query);

  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);
}

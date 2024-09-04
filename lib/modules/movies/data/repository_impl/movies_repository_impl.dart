import 'package:dartz/dartz.dart';
import 'package:hmaserv/core/services/error/failure.dart';
import 'package:hmaserv/modules/movies/data/models/movie_details_model.dart';
import 'package:hmaserv/modules/movies/data/models/movie_model.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_details_entity.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_entity.dart';
import 'package:hmaserv/modules/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  MoviesRepositoryImpl(super._moviesDataSource, super.networkInfo);

  @override
  Future<Either<Failure, List<Movie>>> getMovies() {
    return super.call<List<Movie>>(
      httpRequest: () => moviesDataSource.getMovies(),
      successReturn: (data) => List<Movie>.from(data["results"].map((result) => MovieModel.fromJson(result))),
    );
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) {
    return super.call<MovieDetails>(
      httpRequest: () => moviesDataSource.getMovieDetails(id),
      successReturn: (data) => MovieDetailsModel.fromJson(data),
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovie(String query) {
    return super.call<List<Movie>>(
      httpRequest: () => moviesDataSource.searchMovies(query),
      successReturn: (data) => List<Movie>.from(data["results"].map((result) => MovieModel.fromJson(result))),
    );
  }
}

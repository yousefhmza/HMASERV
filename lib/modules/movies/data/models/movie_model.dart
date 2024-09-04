import 'package:hmaserv/core/utils/constants.dart';
import 'package:hmaserv/core/utils/utils.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.originalTitle,
    required super.overview,
    required super.releaseDate,
    required super.backdropPath,
    required super.posterPath,
    required super.voteAverage,
    required super.voteCount,
    required super.adult,
    required super.genreIds,
    required super.video,
    required super.popularity,
    required super.title,
    required super.originalLanguage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'] ?? 0,
        originalTitle: json['original_title'] ?? "",
        overview: json['overview'] ?? "",
        releaseDate: json['release_date'] ?? "",
        backdropPath: json['backdrop_path'] ?? "",
        posterPath: Utils.imagePath(json['poster_path'] ?? ""),
        voteAverage: double.tryParse(json['vote_average'].toString()) ?? 0.0,
        voteCount: json['vote_count'] ?? 0,
        adult: json['adult'] ?? false,
        genreIds: List<int>.from(json['genre_ids'].map((id) => id)),
        video: json['video'] ?? false,
        popularity: double.tryParse(json['popularity'].toString()) ?? 0.0,
        title: json['title'] ?? "",
        originalLanguage: json['original_language'] ?? "",
      );
}

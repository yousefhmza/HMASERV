import 'package:hmaserv/core/utils/utils.dart';

import '../../domain/entities/movie_details_entity.dart';
import 'collection_model.dart';
import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.adult,
    required super.backdropPath,
    CollectionModel? super.belongsToCollection,
    required super.budget,
    required List<GenreModel> super.genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required List<ProductionCompanyModel> super.productionCompanies,
    required List<ProductionCountryModel> super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required List<SpokenLanguageModel> super.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json['adult'] ?? false,
      backdropPath: Utils.imagePath(json['backdrop_path'] ?? ""),
      belongsToCollection:
          json['belongs_to_collection'] != null ? CollectionModel.fromJson(json['belongs_to_collection']) : null,
      budget: json['budget'] ?? 0,
      genres: List<GenreModel>.from((json['genres'] ?? []).map((genre) => GenreModel.fromJson(genre))),
      homepage: json['homepage'] ?? "",
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'] ?? "",
      originCountry: List<String>.from((json['origin_country'] ?? []).map((country) => country)),
      originalLanguage: json['original_language'] ?? "",
      originalTitle: json['original_title'] ?? "",
      overview: json['overview'] ?? "",
      popularity: double.tryParse(json['popularity'].toString()) ?? 0,
      posterPath: Utils.imagePath(json['poster_path'] ?? ""),
      productionCompanies: List<ProductionCompanyModel>.from(
        (json['production_companies'] ?? []).map((company) => ProductionCompanyModel.fromJson(company)),
      ),
      productionCountries: List<ProductionCountryModel>.from(
        (json['production_countries'] ?? []).map((country) => ProductionCountryModel.fromJson(country)),
      ),
      releaseDate: json['release_date'] ?? "",
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spokenLanguages: List<SpokenLanguageModel>.from(
          (json['spoken_languages'] ?? []).map((language) => SpokenLanguageModel.fromJson(language))),
      status: json['status'] ?? "",
      tagline: json['tagline'] ?? "",
      title: json['title'] ?? "",
      video: json['video'] ?? false,
      voteAverage: double.tryParse(json['vote_average'].toString()) ?? 0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}

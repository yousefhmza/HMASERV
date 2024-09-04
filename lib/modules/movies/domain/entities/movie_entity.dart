class Movie {
  final int id;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final List<int> genreIds;
  final bool video;
  final double popularity;
  final String title;
  final String originalLanguage;

  Movie({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.genreIds,
    required this.video,
    required this.popularity,
    required this.title,
    required this.originalLanguage,
  });
}

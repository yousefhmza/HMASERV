class Collection {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  Collection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });
}

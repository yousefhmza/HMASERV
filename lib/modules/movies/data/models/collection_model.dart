import '../../domain/entities/collection_entity.dart';

class CollectionModel extends Collection {
  CollectionModel({
    required super.id,
    required super.name,
    super.posterPath,
    super.backdropPath,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        posterPath: json['poster_path'] ?? "",
        backdropPath: json['backdrop_path'] ?? "",
      );
}

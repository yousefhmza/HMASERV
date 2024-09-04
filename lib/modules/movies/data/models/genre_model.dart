import '../../domain/entities/genre_entity.dart';

class GenreModel extends Genre {
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
      );
}

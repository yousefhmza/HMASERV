import '../../domain/entities/spoken_language_entity.dart';

class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel({
    required super.englishName,
    required super.iso6391,
    required super.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) => SpokenLanguageModel(
        englishName: json['english_name'] ?? "",
        iso6391: json['iso_639_1'] ?? "",
        name: json['name'] ?? "",
      );
}

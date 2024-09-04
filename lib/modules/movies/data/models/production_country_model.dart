import '../../domain/entities/production_country_entity.dart';

class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({
    required super.iso31661,
    required super.name,
  });

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) => ProductionCountryModel(
        iso31661: json['iso_3166_1'] ?? "",
        name: json['name'] ?? "",
      );
}

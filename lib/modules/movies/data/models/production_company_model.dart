import 'package:hmaserv/core/utils/utils.dart';

import '../../domain/entities/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompany {
  ProductionCompanyModel({
    required super.id,
    required super.name,
    super.logoPath,
    required super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) => ProductionCompanyModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        logoPath: Utils.imagePath(json['logo_path'] ?? ""),
        originCountry: json['origin_country'] ?? "",
      );
}

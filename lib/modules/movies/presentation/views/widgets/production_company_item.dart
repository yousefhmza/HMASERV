import 'package:flutter/material.dart';
import 'package:hmaserv/core/resources/resources.dart';
import 'package:hmaserv/core/view/views.dart';
import 'package:hmaserv/modules/movies/domain/entities/production_company_entity.dart';

class ProductionCompanyItem extends StatelessWidget {
  final ProductionCompany productionCompany;

  const ProductionCompanyItem({required this.productionCompany, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          CustomImage(
            image: productionCompany.logoPath ?? "",
            width: AppSize.s64,
            height: AppSize.s64,
            borderRadius: AppSize.s12,
            fit: BoxFit.contain,
          ),
          HorizontalSpace(AppSize.s8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(productionCompany.name),
                CustomText(productionCompany.originCountry, color: AppColors.grey400, fontSize: FontSize.s12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

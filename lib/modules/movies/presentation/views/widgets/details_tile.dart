import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final String value;

  const DetailsTile({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title, fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s16),
        CustomText(value, color: AppColors.grey400),
      ],
    );
  }
}

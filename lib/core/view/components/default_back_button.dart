import 'package:flutter/material.dart';

import '../../../config/navigation/navigation.dart';
import '../../resources/resources.dart';
import '../views.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.goBack(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p6),
        decoration: const ShapeDecoration(shape: CircleBorder(), color: AppColors.grey200),
        child: CustomIcon(Icons.adaptive.arrow_back_rounded, size: AppSize.s20),
      ),
    );
  }
}

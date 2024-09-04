import 'package:flutter/material.dart';

import '../../../config/navigation/navigation.dart';
import '../../resources/resources.dart';
import '../views.dart';

class ImagesScreen extends StatelessWidget {
  final List<String> images;

  const ImagesScreen({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      isLight: true,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            InteractiveViewer(
              child: Center(
                child: CustomImage(image: images[0], width: double.infinity),
              ),
            ),
            SafeArea(
              child: GestureDetector(
                onTap: () => NavigationService.goBack(),
                child: Container(
                  margin: const EdgeInsets.all(AppPadding.p16),
                  padding: const EdgeInsets.all(AppPadding.p6),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: AppColors.white,
                  ),
                  child: CustomIcon(Icons.adaptive.arrow_back_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

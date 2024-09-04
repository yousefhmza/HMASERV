import 'package:flutter/material.dart';
import 'package:hmaserv/core/extensions/num_extensions.dart';
import 'package:shimmer/shimmer.dart';

//
import '../../resources/resources.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color? baseColor;
  final Color? highLightColor;

  const ShimmerWidget.circular({
    required this.width,
    required this.height,
    this.baseColor,
    this.highLightColor,
    this.shapeBorder = const CircleBorder(),
    super.key,
  });

  ShimmerWidget.rectangular({
    required this.height,
    this.width = double.infinity,
    this.baseColor,
    this.highLightColor,
    double borderRadius = AppSize.s8,
    super.key,
  }) : shapeBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius.r));

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade100,
      highlightColor: highLightColor ?? Colors.grey.shade50,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(shape: shapeBorder, color: AppColors.grey200),
      ),
    );
  }
}

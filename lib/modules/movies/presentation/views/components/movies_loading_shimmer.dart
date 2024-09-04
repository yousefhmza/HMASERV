import 'package:flutter/material.dart';
import 'package:hmaserv/core/resources/resources.dart';
import 'package:hmaserv/core/view/views.dart';

class MoviesLoadingShimmer extends StatelessWidget {
  const MoviesLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppPadding.p16),
      sliver: SliverList.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => VerticalSpace(AppSize.s16),
        itemBuilder: (context, index) => ShimmerWidget.rectangular(width: double.infinity, height: AppSize.s120),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hmaserv/core/resources/app_strings.dart';
import 'package:hmaserv/core/utils/utils.dart';
import 'package:hmaserv/core/view/views.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_entity.dart';

import '../../../../../config/navigation/navigation.dart';
import '../../../../../core/resources/resources.dart';

class MovieItem extends StatelessWidget {
  final Animation<double> animation;
  final Movie movie;

  const MovieItem({required this.animation, required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      key: ValueKey(movie.id),
      position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(
        CurvedAnimation(parent: animation, curve: const ElasticOutCurve(0.8)),
      ),
      child: GestureDetector(
        onTap: () => NavigationService.push(Routes.movieDetailsScreen, arguments: {"id": movie.id}),
        child: Container(
          margin: const EdgeInsets.only(bottom: AppPadding.p16),
          padding: const EdgeInsets.all(AppPadding.p16),
          clipBehavior: Clip.antiAlias,
          foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s8)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSize.s8),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withOpacity(0.15),
                blurRadius: AppSize.s8,
                offset: const Offset(AppSize.s0, AppSize.s4),
              )
            ],
          ),
          child: Row(
            children: [
              Hero(
                tag: movie.id,
                child: CustomImage(
                  image: movie.posterPath,
                  width: AppSize.s82,
                  height: AppSize.s82,
                  borderRadius: AppSize.s8,
                ),
              ),
              HorizontalSpace(AppSize.s8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: CustomText(movie.title, fontWeight: FontWeightManager.semiBold)),
                        HorizontalSpace(AppSize.s6),
                        CustomIcon(Icons.star_rate_rounded, size: AppSize.s20, color: AppColors.rating),
                        CustomText(
                          movie.voteAverage.toStringAsFixed(1),
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.bold,
                          color: AppColors.rating,
                        ),
                      ],
                    ),
                    VerticalSpace(AppSize.s2),
                    CustomText(
                      Utils.formatStandardDate(movie.releaseDate),
                      fontSize: FontSize.s12,
                      color: AppColors.grey400,
                    ),
                    VerticalSpace(AppSize.s4),
                    Row(
                      children: [
                        Container(
                          decoration: ShapeDecoration(shape: StadiumBorder(side: BorderSide(color: AppColors.grey400))),
                          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p2),
                          child: CustomText(movie.originalLanguage, fontSize: FontSize.s12, color: AppColors.grey400),
                        ),
                        const Spacer(),
                        if (movie.adult)
                          CustomText(AppStrings.plus18, color: AppColors.warning, fontWeight: FontWeightManager.bold),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

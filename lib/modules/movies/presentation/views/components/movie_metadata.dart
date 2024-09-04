import 'package:flutter/material.dart';
import 'package:hmaserv/modules/movies/domain/entities/movie_details_entity.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/view/views.dart';

class MovieMetadata extends StatelessWidget {
  final MovieDetails movieDetails;

  const MovieMetadata({required this.movieDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.75,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: AppColors.primary,
      ),
      child: Stack(
        children: [
          CustomImage(
            image: movieDetails.posterPath,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  movieDetails.title,
                  color: AppColors.white,
                  fontSize: FontSize.s18,
                  fontWeight: FontWeightManager.bold,
                ),
                CustomText(
                  Utils.formatStandardDate(movieDetails.releaseDate),
                  color: AppColors.white,
                  fontSize: FontSize.s12,
                  fontWeight: FontWeightManager.bold,
                ),
                VerticalSpace(AppSize.s2),
                CustomText(
                  movieDetails.overview,
                  color: AppColors.grey300,
                  fontSize: FontSize.s12,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: AppPadding.p8,
            end: AppPadding.p8,
            start: AppPadding.p8,
            child: Row(
              children: [
                CustomIcon(Icons.star_rate_rounded, size: AppSize.s22, color: AppColors.lightRating),
                CustomText(
                  movieDetails.voteAverage.toStringAsFixed(1),
                  fontSize: FontSize.s14,
                  fontWeight: FontWeightManager.bold,
                  color: AppColors.lightRating,
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(side: BorderSide(color: AppColors.white)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIcon(Icons.timer, color: AppColors.white, size: AppSize.s16),
                      HorizontalSpace(AppSize.s4),
                      CustomText(
                        Utils.formatRuntime(movieDetails.runtime),
                        fontSize: FontSize.s12,
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

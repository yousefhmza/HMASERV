import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmaserv/core/resources/app_strings.dart';
import 'package:hmaserv/core/resources/resources.dart';
import 'package:hmaserv/core/utils/alerts.dart';
import 'package:hmaserv/core/utils/utils.dart';
import 'package:hmaserv/core/view/views.dart';
import 'package:hmaserv/modules/movies/presentation/views/components/movie_metadata.dart';
import 'package:hmaserv/modules/movies/presentation/views/widgets/details_tile.dart';
import 'package:hmaserv/modules/movies/presentation/views/widgets/genre_chip.dart';
import 'package:hmaserv/modules/movies/presentation/views/widgets/production_company_item.dart';

import '../../cubits/movies/movies_cubit.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;

  const MovieDetailsScreen({required this.id, super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MoviesCubit moviesCubit;

  @override
  void initState() {
    super.initState();
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    moviesCubit.getMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MoviesCubit, MoviesStates>(
          listener: (context, state) {
            if (state is GetMovieDetailsFailureState) {
              Alerts.showSnackBar(
                context,
                message: state.failure.message,
                onActionPressed: () => moviesCubit.getMovieDetails(widget.id),
              );
            }
          },
          builder: (context, state) {
            if (state is GetMovieDetailsLoadingState) {
              return Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultBackButton(),
                    const VerticalSpace(AppSize.s16),
                    Hero(
                      tag: widget.id,
                      child: ShimmerWidget.rectangular(
                        height: MediaQuery.of(context).size.height / 1.75,
                        width: double.infinity,
                        borderRadius: AppSize.s12,
                        baseColor: AppColors.grey200,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is GetMovieDetailsSuccessState) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultBackButton(),
                    VerticalSpace(AppSize.s16),
                    MovieMetadata(movieDetails: moviesCubit.movieDetails!),
                    VerticalSpace(AppSize.s16),
                    Wrap(
                      spacing: AppSize.s8,
                      runSpacing: AppSize.s8,
                      children: List.generate(
                        moviesCubit.movieDetails!.genres.length,
                        (index) => GenreChip(
                          genre: moviesCubit.movieDetails!.genres[index],
                        ),
                      ),
                    ),
                    VerticalSpace(AppSize.s16),
                    DetailsTile(
                      title: AppStrings.budget,
                      value: "${Utils.formatWithSeparator(moviesCubit.movieDetails!.budget)}\$",
                    ),
                    const Divider(height: AppSize.s32),
                    DetailsTile(
                      title: AppStrings.revenue,
                      value: "${Utils.formatWithSeparator(moviesCubit.movieDetails!.revenue)}\$",
                    ),
                    const Divider(height: AppSize.s32),
                    CustomText(
                      AppStrings.productionCompanies,
                      fontWeight: FontWeightManager.semiBold,
                      fontSize: FontSize.s16,
                    ),
                    VerticalSpace(AppSize.s4),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ProductionCompanyItem(
                        productionCompany: moviesCubit.movieDetails!.productionCompanies[index],
                      ),
                      separatorBuilder: (context, index) => VerticalSpace(AppSize.s8),
                      itemCount: moviesCubit.movieDetails!.productionCompanies.length,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

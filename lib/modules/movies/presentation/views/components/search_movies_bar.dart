import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hmaserv/config/navigation/navigation.dart';
import 'package:hmaserv/core/extensions/num_extensions.dart';
import 'package:hmaserv/core/resources/app_strings.dart';
import 'package:hmaserv/core/utils/debouncer.dart';
import 'package:hmaserv/modules/movies/presentation/cubits/search/search_cubit.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../domain/entities/movie_entity.dart';

class SearchMoviesBar extends StatefulWidget {
  const SearchMoviesBar({super.key});

  @override
  State<SearchMoviesBar> createState() => _SearchMoviesBarState();
}

class _SearchMoviesBarState extends State<SearchMoviesBar> {
  late final SearchCubit searchCubit;
  final DeBouncer deBouncer = DeBouncer();

  @override
  void initState() {
    super.initState();
    searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.blue,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(cardColor: AppColors.white),
        child: TypeAheadField<Movie>(
          debounceDuration: Time.t700ms,
          hideOnUnfocus: true,
          constraints:
              BoxConstraints(maxHeight: AppSize.s280.h, maxWidth: MediaQuery.of(context).size.width - AppSize.s24),
          suggestionsCallback: (search) async {
            await searchCubit.searchMovies(search);
            return searchCubit.movies;
          },
          offset: const Offset(AppSize.s0, AppSize.s12),
          loadingBuilder: (context) => const LoadingSpinner(),
          builder: (context, controller, focusNode) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: CustomTextField(
              controller: controller,
              focusNode: focusNode,
              hintText: AppStrings.searchMovies,
            ),
          ),
          itemSeparatorBuilder: (context, index) =>
              const Divider(indent: AppPadding.p16, endIndent: AppPadding.p16, height: AppSize.s1),
          itemBuilder: (context, movie) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p8),
            child: Row(
              children: [
                CustomImage(
                  image: movie.posterPath,
                  width: AppSize.s48,
                  height: AppSize.s48,
                  borderRadius: AppSize.s6,
                ),
                HorizontalSpace(AppSize.s6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(movie.title, fontWeight: FontWeightManager.semiBold, maxLines: 1, autoSized: true),
                      Row(
                        children: [
                          CustomIcon(Icons.star_rate_rounded, size: AppSize.s20, color: AppColors.rating),
                          CustomText(
                            movie.voteAverage.toStringAsFixed(1),
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.bold,
                            color: AppColors.rating,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          onSelected: (movie) => NavigationService.push(Routes.movieDetailsScreen, arguments: {"id": movie.id}),
        ),
      ),
    );
  }
}

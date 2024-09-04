import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmaserv/core/resources/app_strings.dart';
import 'package:hmaserv/core/services/responsive/responsive_service.dart';
import 'package:hmaserv/core/utils/alerts.dart';
import 'package:hmaserv/modules/movies/presentation/views/components/movies_loading_shimmer.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../cubits/movies/movies_cubit.dart';
import '../components/search_movies_bar.dart';
import '../widgets/movie_item.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late final MoviesCubit moviesCubit;

  @override
  void initState() {
    super.initState();
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    moviesCubit.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {
          if (state is GetMoviesFailureState) {
            Alerts.showSnackBar(context, message: state.failure.message, onActionPressed: moviesCubit.getMovies);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              top: false,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.white,
                    elevation: 0,
                    automaticallyImplyLeading: true,
                    stretch: true,
                    pinned: true,
                    expandedHeight: AppSize.s120,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p16).copyWith(bottom: AppPadding.p12),
                      collapseMode: CollapseMode.parallax,
                      centerTitle: false,
                      title: CustomText(AppStrings.popularMovies,
                          fontWeight: FontWeightManager.bold, fontSize: FontSize.s18),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SearchMoviesBar()),
                  state is GetMoviesLoadingState
                      ? const MoviesLoadingShimmer()
                      : SliverPadding(
                          padding: const EdgeInsets.all(AppPadding.p16),
                          sliver: SliverAnimatedList(
                            key: moviesCubit.listKey,
                            initialItemCount: moviesCubit.movies.length,
                            itemBuilder: (context, index, animation) => MovieItem(
                              animation: animation,
                              movie: moviesCubit.movies[index],
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

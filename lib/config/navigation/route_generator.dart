import 'package:flutter/material.dart';
import '../../modules/movies/presentation/views/screens/movie_details_screen.dart';
import '../../modules/movies/presentation/views/screens/movies_screen.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case Routes.moviesScreen:
        return platformPageRoute(const MoviesScreen(), settings);
      case Routes.movieDetailsScreen:
        return platformPageRoute(MovieDetailsScreen(id: arguments!["id"]), settings);
      default:
        return platformPageRoute(const Scaffold(), settings);
    }
  }
}

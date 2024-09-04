class EndPoints {
  static const String getMovies = "/movie/popular";
  static String getMovieDetails(int id) => "/movie/$id";
  static const String searchMovie = "/search/movie";
}

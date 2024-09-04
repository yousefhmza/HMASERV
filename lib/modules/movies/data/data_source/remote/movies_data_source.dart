import 'package:hmaserv/core/services/network/endpoints.dart';
import 'package:hmaserv/core/utils/constants.dart';

import '../../../../../core/services/network/api_client.dart';
import '../../../../../core/services/network/api_response.dart';

class MoviesDataSource {
  final ApiClient _apiClient;

  MoviesDataSource(this._apiClient);

  Future<APIResponse> getMovies() async {
    return _apiClient.get(url: EndPoints.getMovies, queryParameters: {"api_key": Constants.apiKey});
  }

  Future<APIResponse> searchMovies(String query) async {
    return _apiClient.get(url: EndPoints.searchMovie, queryParameters: {"api_key": Constants.apiKey, "query": query});
  }

  Future<APIResponse> getMovieDetails(int id) async {
    return _apiClient.get(url: EndPoints.getMovieDetails(id), queryParameters: {"api_key": Constants.apiKey});
  }
}

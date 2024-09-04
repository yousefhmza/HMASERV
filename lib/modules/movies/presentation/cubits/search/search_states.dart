part of 'search_cubit.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchMoviesLoadingState extends SearchStates {}

class SearchMoviesSuccessState extends SearchStates {}

class SearchMoviesFailureState extends SearchStates {
  final Failure failure;

  SearchMoviesFailureState(this.failure);
}

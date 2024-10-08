part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<Search> searchList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => SearchState(
        searchList: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}

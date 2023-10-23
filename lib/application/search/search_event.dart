part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.Initialize() = Initialize;
  const factory SearchEvent.SearchMovie({
    required String movieQuery,
  }) = SearchMovie;
}

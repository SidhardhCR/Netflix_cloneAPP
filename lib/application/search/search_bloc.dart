import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failures.dart';
import 'package:netflix_clone_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone_app/domain/downloads/models/downloads.dart';
import 'package:netflix_clone_app/domain/search/i_search_reo.dart';
import 'package:netflix_clone_app/domain/search/models/search/result.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsrepo;
  final ISearchRepo _iSearchRepo;
  SearchBloc(this._downloadsrepo, this._iSearchRepo)
      : super(SearchState.initial()) {
    //Idle
    on<Initialize>((event, emit) async {
      //call api
      emit(state.copyWith(isLoading: true, isError: false));
      final Either<MainFailures, List<Downloads>> searchIdle =
          await _downloadsrepo.getDownloadsImage();
      emit(searchIdle.fold(
          (failure) => state.copyWith(
              isLoading: false, isError: true, idleList: [], searchList: []),
          (success) => state.copyWith(
              isLoading: false,
              isError: false,
              idleList: success,
              searchList: [])));
    });

    //afterSearch
    on<SearchMovie>((event, emit) async {
      log('Search fo ${event.movieQuery}');
      //api call
      emit(state.copyWith(isLoading: true, isError: false));

      final Either<MainFailures, List<Search>> result =
          await _iSearchRepo.searchMovies(movieQuery: event.movieQuery);
      print(result);
      emit(
        result.fold(
            (failure) => state.copyWith(
                  isLoading: false,
                  isError: true,
                ),
            (success) => state.copyWith(
                isLoading: false, isError: false, searchList: success)),
      );
    });
  }
}

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failures.dart';
import 'package:netflix_clone_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone_app/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsrepo;
  DownloadsBloc(this._downloadsrepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(isLoading: true, downloadsSuccesOrFailureOption: none()),
      );
      final Either<MainFailures, List<Downloads>> downloadOption =
          await _downloadsrepo.getDownloadsImage();
      print(downloadOption.toString());
      emit(
        downloadOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsSuccesOrFailureOption: Some(
              Left(failure),
              
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsSuccesOrFailureOption: Some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}

part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
     List<Downloads>? downloads,
    required Option<Either<MainFailures, List<Downloads>>>
        downloadsSuccesOrFailureOption,
  }) = _DownloadState;

  factory DownloadsState.initial() {
    return const DownloadsState(
      isLoading: false,
      downloadsSuccesOrFailureOption: None(),
    
    );
  }
}

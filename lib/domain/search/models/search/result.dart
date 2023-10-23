import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Search with _$Search {
  factory Search({
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'poster_path') String? posterPath,
  }) = _Result;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}

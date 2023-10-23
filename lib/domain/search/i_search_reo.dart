import 'package:dartz/dartz.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failures.dart';
import 'package:netflix_clone_app/domain/search/models/search/result.dart';

abstract class ISearchRepo {
  Future<Either<MainFailures, List<Search>>> searchMovies({
    required movieQuery,
  });
}

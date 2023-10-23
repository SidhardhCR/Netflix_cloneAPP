
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/api_end_points.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failures.dart';
import 'package:netflix_clone_app/domain/search/i_search_reo.dart';
import 'package:netflix_clone_app/domain/search/models/search/result.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository implements ISearchRepo {
  @override
  Future<Either<MainFailures, List<Search>>> searchMovies(
      {required movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data['results'] as List)
            .map((e) => Search.fromJson(e))
            .toList();

        return Right(result);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailures.clientFailures());
    }
  }
}

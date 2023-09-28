import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/api_end_points.dart';
import 'package:netflix_clone_app/domain/core/failures/main_failures.dart';
import 'package:netflix_clone_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone_app/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data['results'] as List)
            .map((e) => Downloads.fromJson(e))
            .toList();
        print(downloadList);
        return Right(downloadList);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailures.clientFailures());
    }
  }
}

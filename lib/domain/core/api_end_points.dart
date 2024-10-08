import 'package:netflix_clone_app/core/strings.dart';
import 'package:netflix_clone_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/movie/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey&";
}

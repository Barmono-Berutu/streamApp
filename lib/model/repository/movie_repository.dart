import 'package:dartz/dartz.dart';
import 'package:movie_app/model/models/movie_models.dart';

abstract class MovieReposytori {
  Future<Either<String, MovieResModel>> getDiscover({int page = 1});
}

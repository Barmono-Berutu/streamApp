import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/model/models/movie_models.dart';
import 'package:movie_app/model/repository/movie_repository.dart';

class MovieResImple implements MovieReposytori {
  final Dio _dio;

  MovieResImple(this._dio);

  @override
  Future<Either<String, MovieResModel>> getDiscover({int page = 1}) async {
    try {
      final result = await _dio.get(
        '/discover/movie',
        queryParameters: {'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResModel.fromJson(result.data);
        return Right(model);
      }

      return Left('error dalam mengambil data');
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }
      return Left('err lain mengambil discover movie');
    }
  }
}

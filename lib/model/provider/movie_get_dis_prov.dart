import 'package:flutter/material.dart';
import 'package:movie_app/model/models/movie_models.dart';
import 'package:movie_app/model/repository/movie_repository.dart';

class MovieGetDisProve with ChangeNotifier {
  final MovieReposytori _movieReposytori;

  MovieGetDisProve(this._movieReposytori);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  void getDiscover(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final result = await _movieReposytori.getDiscover();

    result.fold(
      (err) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(err)));
        _isLoading = false;
        notifyListeners();
        return;
      },
      (res) {
        _movies.clear();
        _movies.addAll(res.results);
        _isLoading = false;
        notifyListeners();
        return;
      },
    );
  }

  // void getDiscoverPage(){

  // }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_app/api_data/api.dart';
import 'package:movie_app/model/pages/home_data/home.dart';
import 'package:movie_app/model/provider/movie_get_dis_prov.dart';
import 'package:movie_app/model/repository/movie_repositori_imple.dart';
import 'package:movie_app/model/repository/movie_repository.dart';
import 'package:movie_app/model/theme/theme_prov.dart';
import 'package:provider/provider.dart';

void main() {
  // Memulai splash screen
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  final dioOption = BaseOptions(
      baseUrl: api.url_api, queryParameters: {'api_key': api.api_key});
  final Dio dio = Dio(dioOption);
  final MovieReposytori movieReposytori = MovieResImple(dio);
  runApp(MyApp(
    movieReposytori: movieReposytori,
  ));

  // Menghapus splash screen setelah aplikasi mulai
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.movieReposytori});

  final MovieReposytori movieReposytori;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MovieGetDisProve(movieReposytori)),
        ChangeNotifierProvider(create: (_) => ThemeProv())
      ],
      child: Consumer<ThemeProv>(builder: (_, value, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          theme: value.themeData,
        );
      }),
    );
  }
}

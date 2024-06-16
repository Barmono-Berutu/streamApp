import 'package:flutter/material.dart';
import 'package:movie_app/model/provider/movie_get_dis_prov.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieGetDisProve>().getDiscover(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Dasds"),
      ),
      body: Consumer<MovieGetDisProve>(
        builder: (_, value, __) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.movies.isNotEmpty) {
            return ListView.builder(
              itemCount: value.movies.length,
              itemBuilder: (context, index) {
                final movie = value.movies[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
            );
          }

          return Center(
            child: Text("Data Not Found"),
          );
        },
      ),
    );
  }
}

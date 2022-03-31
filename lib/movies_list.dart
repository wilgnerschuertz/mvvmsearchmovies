// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'viewModel/movie_view_model.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  const MovieList({required this.movies});

  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,

      itemBuilder: (context, index) {

        final movie = movies[index];

        return ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie.poster)
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
              width: 100,
              height: 150,
            ),
          ),
          title: Text(movie.title),
        );
      },
    );
  }
}
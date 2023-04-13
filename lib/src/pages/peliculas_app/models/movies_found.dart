// To parse this JSON data, do
//
//     final movieFound = movieFoundFromMap(jsonString);

import 'dart:convert';

import 'package:componentes/src/pages/peliculas_app/models/movie.dart';

class MoviesFound {
  MoviesFound({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MoviesFound.fromJson(String str) =>
      MoviesFound.fromMap(json.decode(str));

  factory MoviesFound.fromMap(Map<String, dynamic> json) => MoviesFound(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

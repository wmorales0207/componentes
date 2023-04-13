// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';
import 'package:componentes/src/pages/peliculas_app/models/movie.dart';

class Popular {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  Popular({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Popular.fromJson(String str) => Popular.fromMap(json.decode(str));

  factory Popular.fromMap(Map<String, dynamic> json) => Popular(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

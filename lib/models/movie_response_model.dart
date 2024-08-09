import 'dart:convert';

import 'package:peliculas_prueba/models/movie_model.dart';

class MoviesResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromRawJson(String str) =>
      MoviesResponse.fromJson(json.decode(str));

  factory MoviesResponse.fromJson(Map<dynamic, dynamic> json) => MoviesResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

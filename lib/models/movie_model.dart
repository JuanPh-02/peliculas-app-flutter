import 'dart:convert';

import 'package:peliculas_prueba/models/models.dart';

class Movie {
  String? backdropPath;
  List<Genre>? genres;
  int id;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String? studio;
  String title;
  double voteAverage;

  Movie({
    this.backdropPath,
    this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    this.studio,
    required this.title,
    required this.voteAverage,
  });

  get fullPosterImg {
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  get fullBackdropPath {
    return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    final genresJson = json["genres"] as List<dynamic>? ?? [];
    final productionCompaniesJson =
        json["production_companies"] as List<dynamic>?;

    return Movie(
      backdropPath: json["backdrop_path"] ?? '',
      genres: genresJson.isNotEmpty
          ? List<Genre>.from(genresJson.map((x) => Genre.fromJson(x)))
          : null,
      id: json["id"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      studio:
          productionCompaniesJson != null && productionCompaniesJson.isNotEmpty
              ? productionCompaniesJson[0]['name'] as String?
              : '',
      title: json["title"],
      voteAverage: json["vote_average"]?.toDouble(),
    );
  }
}

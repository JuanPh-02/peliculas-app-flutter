import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_prueba/global/Environment.dart';
import 'package:peliculas_prueba/models/models.dart';
import 'package:tmdb_api/tmdb_api.dart';

// Eventos
abstract class MovieEvent {}

class LoadMovies extends MovieEvent {}

class SearchMovies extends MovieEvent {
  final String query;
  SearchMovies(this.query);
}

class LoadMovieDetails extends MovieEvent {
  final int movieId;
  LoadMovieDetails(this.movieId);
}

// Estados
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  MovieLoaded(this.popularMovies, this.topRatedMovies);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}

class MovieDetailsLoading extends MovieState {}

class MovieDetailsLoaded extends MovieState {
  final Movie movie;
  final List<Actor> actors;
  MovieDetailsLoaded(this.movie, this.actors);
}

class MovieDetailsError extends MovieState {
  final String message;
  MovieDetailsError(this.message);
}

// Bloc
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final TMDB _tmdb = TMDB(
      ApiKeys(Environment.API_KEY, Environment.API_READ_ACCESS_TOKEN),
      defaultLanguage: 'es-ES',
      logConfig: const ConfigLogger(showLogs: true));

  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  Map<int, String> genreMap = {};

  MovieBloc() : super(MovieInitial()) {

    on<LoadMovies>((event, emit) async {
      // Verificar si ya hay películas cargadas
      if (popularMovies.isNotEmpty) {
        emit(MovieLoaded(popularMovies, topRatedMovies));
        return;
      }

      // Si no hay películas cargadas, cargar desde la API
      emit(MovieLoading());
      try {
        final resultPopularMovies = await _tmdb.v3.movies.getPopular();
        final resultTopRatedMovies = await _tmdb.v3.movies.getTopRated();

        final popularMoviesResponse =
            MoviesResponse.fromJson(resultPopularMovies);
        final topRatedResponse =
            MoviesResponse.fromJson(resultTopRatedMovies);

        popularMovies = [...popularMovies, ...popularMoviesResponse.results];
        topRatedMovies = [...topRatedMovies, ...topRatedResponse.results];

        emit(MovieLoaded(popularMovies, topRatedMovies));
      } catch (error) {
        emit(MovieError('Error al cargar las películas: ${error.toString()}'));
      }
    });

    on<LoadMovieDetails>((event, emit) async {
      emit(MovieDetailsLoading());
      try {
        final result = await _tmdb.v3.movies.getDetails(event.movieId);
        final credits = await _tmdb.v3.movies.getCredits(event.movieId);

        final movieDetails = Movie.fromJson(result);
        final casting =
            List<Actor>.from(credits["cast"].map((x) => Actor.fromJson(x)));

        emit(MovieDetailsLoaded(movieDetails, casting));
      } catch (error) {
        emit(MovieDetailsError(
            'Error al cargar la película: ${error.toString()}'));
      }
    });
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:peliculas_prueba/blocs/movie_bloc.dart';

void main() {
  group('MovieBloc', () {
    blocTest<MovieBloc, MovieState>(
      'emite [MovieLoading] when LoadMovies es añadido',
      build: () => MovieBloc(),
      act: (bloc) => bloc.add(LoadMovies()),
      expect: () => [
        isA<MovieLoading>()
      ],
    );
  });
  group('MovieBloc', () {
    blocTest<MovieBloc, MovieState>(
      'emite [MovieLoading] cuando LoadMovies es añadido',
      build: () => MovieBloc(),
      act: (bloc) => bloc.add(LoadMovies()),
      expect: () => [
        isA<MovieLoading>()
      ],
    );
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_prueba/blocs/movie_bloc.dart';
import 'package:peliculas_prueba/models/models.dart';
import 'package:peliculas_prueba/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    context.read<MovieBloc>().add(LoadMovieDetails(movie.id));

    return Scaffold(
      backgroundColor: const Color(0xFF232F3D),
      body: CustomScrollView(
        slivers: [
          // Imagen Superior Pelicula - App Bar
          _CustomAppBar(movie),

          // Información de la Película
          SliverList(
            delegate: SliverChildListDelegate([
              _TitleAndQualification(movie),
              _Overview(movie),
              CastingSlider(movie.id),
              _AdditionalInfo(movie),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pop();
        context.read<MovieBloc>().add(LoadMovies());
      },
      child: SliverAppBar(
        backgroundColor: Colors.transparent,
        expandedHeight: 250,
        floating: false,
        pinned: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.grey[200],
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<MovieBloc>().add(LoadMovies());
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.grey[200],
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.zero,
          background: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/no-image.png'),
              image: NetworkImage(movie.fullBackdropPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleAndQualification extends StatelessWidget {
  final Movie movie;

  const _TitleAndQualification(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la Película
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // Botón de ver y calificación
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botón de ver
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'WATCH NOW',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[100],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Barra de calificación
              CustomRatingBar(
                rating: movie.voteAverage,
                itemSize: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.grey[400], height: 1.8),
      ),
    );
  }
}

class _AdditionalInfo extends StatelessWidget {
  final Movie movie;

  const _AdditionalInfo(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
      child: Column(
        children: [
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieDetailsLoaded) {
                final detailsMovie = state.movie;
                final genreNames = detailsMovie.genres
                        ?.map((genre) => genre.name)
                        .join(', ') ??
                    'Géneros no disponibles.';

                return Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Studio',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, height: 1.8),
                        ),
                        const SizedBox(width: 30),
                        Text(detailsMovie.studio ?? 'Desconocido'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Genres',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, height: 1.8),
                        ),
                        const SizedBox(width: 30),
                        Text(genreNames),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Release',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, height: 1.8),
                        ),
                        const SizedBox(width: 30),
                        Text(movie.releaseDate),
                      ],
                    ),
                  ],
                );
              } else if (state is MovieDetailsLoading) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (state is MovieDetailsError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Algo ha salido mal!'));
              }
            },
          ),
        ],
      ),
    );
  }
}

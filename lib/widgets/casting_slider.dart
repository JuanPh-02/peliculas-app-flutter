import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_prueba/blocs/movie_bloc.dart';
import 'package:peliculas_prueba/models/models.dart';

class CastingSlider extends StatelessWidget {
  final int movieId;

  const CastingSlider(this.movieId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieDetailsLoaded) {
          final actors = state.actors;

          return Container(
            width: double.infinity,
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    key: PageStorageKey(movieId),
                    scrollDirection: Axis.horizontal,
                    itemCount: actors.length,
                    itemBuilder: (_, int index) => _ActorAvatar(actors[index]),
                  ),
                ),
              ],
            ),
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
    );
  }
}

class _ActorAvatar extends StatelessWidget {
  final Actor actor;

  const _ActorAvatar(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 40,
                foregroundColor: Colors.grey,
                backgroundImage: NetworkImage(actor.fullProfileImg) ,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            actor.originalName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_prueba/blocs/cubit/theme_cubit_cubit.dart';
import 'package:peliculas_prueba/blocs/movie_bloc.dart';
import 'package:peliculas_prueba/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(LoadMovies());
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: themeCubit.state.isDarkMode
                  ? Icon(
                      Icons.sunny,
                      // color: Colors.grey[200],
                      size: 26,
                    )
                  : Icon(
                      Icons.nightlight_outlined,
                      // color: Colors.grey[200],
                      size: 26,
                    ),
              onPressed: () {
                themeCubit.toggleTheme();
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Texto Inicial y barra de búsqueda
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Texto Inicial
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 250,
                        child: const Text(
                          'Hello, what do you want to watch ?',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Barra de búsqueda
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.focusColor,
                          prefixIcon:
                              const Icon(Icons.search),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                        ),
                        cursorColor: Colors.grey[800],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: size.height * 0.7,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(30),
                      topEnd: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is MovieLoaded) {
                          return Column(
                            children: [
                              // Slider de Peliculas Populares
                              MovieSlider(
                                movies: state.popularMovies,
                                title: 'POPULAR MOVIES',
                                loadMoreData: () => context
                                    .read<MovieBloc>()
                                    .add(LoadMoreMovies('popular')),
                              ),
                              // Slider de Peliculas Mejor Valoradas
                              MovieSlider(
                                movies: state.topRatedMovies,
                                title: 'TOP RATED',
                                loadMoreData: () => context
                                    .read<MovieBloc>()
                                    .add(LoadMoreMovies('rated')),
                              ),
                            ],
                          );
                        } else if (state is MovieLoading) {
                          return SizedBox(
                            width: double.infinity,
                            height: size.height * 0.7,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is MovieError) {
                          return SizedBox(
                            width: double.infinity,
                            height: size.height * 0.7,
                            child: const Center(
                                child: Text('Oops, ha ocurrido un error')),
                          );
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            height: size.height * 0.7,
                            child: const Center(child: Text('Algo ha salido mal!')),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

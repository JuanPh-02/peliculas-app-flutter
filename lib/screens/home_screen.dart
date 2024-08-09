import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(
              Icons.nightlight_outlined,
              color: Colors.grey[200],
            ),
            // floating: false,
            // pinned: true,
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
                        // color: Colors.red,
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
                          fillColor: const Color(0x33FFFFFF),
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey[200]),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[200]),
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
                  decoration: const BoxDecoration(
                    color: Color(0xFF232F3D),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(30),
                      topEnd: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:
                        // Slider de Peliculas Populares
                        BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is MovieLoaded) {
                          return Column(
                            children: [
                              MovieSlider(
                                movies: state.popularMovies,
                                title: 'POPULAR MOVIES',
                              ),
                              // Slider de Peliculas Mejor Valoradas
                              MovieSlider(
                                movies: state.topRatedMovies,
                                title: 'TOP RATED',
                              ),
                              // // Slider de Peliculas Mejor Valoradas
                              // MovieSlider(title: 'TOP RATED'),
                              // // Slider de Peliculas Mejor Valoradas
                              // MovieSlider(title: 'TOP RATED')
                            ],
                          );
                        } else if (state is MovieLoading) {
                          return const SizedBox(
                            width: double.infinity,
                            height: 360,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is MovieError) {
                          return const SizedBox(
                            width: double.infinity,
                            height: 360,
                            child: Center(
                                child: Text('Oops, ha ocurrido un error')),
                          );
                        } else {
                          return const SizedBox(
                            width: double.infinity,
                            height: 360,
                            child: Center(child: Text('Algo ha salido mal!')),
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

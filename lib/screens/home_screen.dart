import 'package:flutter/material.dart';
import 'package:peliculas_prueba/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF5086B2),
      backgroundColor: Colors.blue[400],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue[400],
            leading: Icon(
              Icons.nightlight_outlined,
              color: Colors.grey[200],
            ),
            // floating: false,
            // pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto Inicial
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // color: Colors.red,
                    width: 250,
                    child: const Text(
                      'Hello, what do you want to watch ?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Barra de búsqueda
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // height: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[200],
                        ),
                        Text(
                          'Search',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(30),
                  topEnd: Radius.circular(30),
                ),
                child: Container(
                  color: Color(0xFF232F3D),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        // Slider de Peliculas Recomendadas
                        MovieSlider(title: 'RECOMMENDED FOR YOU'),

                        // Slider de Peliculas Mejor Valoradas
                        MovieSlider(title: 'TOP RATED'),
                        // Slider de Peliculas Mejor Valoradas
                        MovieSlider(title: 'TOP RATED'),
                        // Slider de Peliculas Mejor Valoradas
                        MovieSlider(title: 'TOP RATED')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                        margin: EdgeInsets.only(top: 10),
                        // color: Colors.red,
                        width: 250,
                        child: const Text(
                          'Hello, what do you want to watch ?',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
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
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        cursorColor: Colors.grey[800],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF232F3D),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(30),
                      topEnd: Radius.circular(30),
                    ),
                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

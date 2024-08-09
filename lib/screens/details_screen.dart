import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:peliculas_prueba/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232F3D),
      body: CustomScrollView(
        slivers: [
          // Imagen Superior Pelicula - App Bar
          _CustomAppBar(),

          // Información de la Película
          SliverList(
            delegate: SliverChildListDelegate([
              _TitleAndQualification(),
              _Overview(),
              ActorsSlider(),
              _AdditionalInfo(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
        onPressed: () => Navigator.of(context).pop(),
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
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        background: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: FadeInImage(
            placeholder: AssetImage('assets/img/no-image.png'),
            image: NetworkImage(
                'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2018/04/13/15236117183294.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _TitleAndQualification extends StatelessWidget {
  const _TitleAndQualification({super.key});

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
            'Título de la Película',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // Botón de ver y calificación
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botón de ver
              Container(
                width: 140,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
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
              RatingBarIndicator(
                rating: 3,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Text(
        'In culpa excepteur laboris esse nostrud. Ut aliquip proident minim ut velit cupidatat quis irure ipsum tempor dolore quis quis. Id do qui nisi elit eu ea aliquip aute quis ex voluptate qui dolore deserunt. Exercitation pariatur et proident nisi ad ut nulla cillum officia adipisicing ad ea. Velit minim ut sunt non deserunt labore est minim.',
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.grey[400], height: 1.8),
      ),
    );
  }
}

class _AdditionalInfo extends StatelessWidget {
  const _AdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Studio',
                style: TextStyle(fontWeight: FontWeight.bold, height: 1.8),
              ),
              SizedBox(width: 30),
              Text('Walt Disney Picture, Pixar'),
            ],
          ),
          Row(
            children: [
              Text(
                'Genre',
                style: TextStyle(fontWeight: FontWeight.bold, height: 1.8),
              ),
              SizedBox(width: 30),
              Text('Animación, Familia, Aventura, Comedia'),
            ],
          ),
          Row(
            children: [
              Text(
                'Release',
                style: TextStyle(fontWeight: FontWeight.bold, height: 1.8),
              ),
              SizedBox(width: 30),
              Text('2024'),
            ],
          ),
        ],
      ),
    );
  }
}

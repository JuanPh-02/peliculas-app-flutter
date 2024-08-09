import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_prueba/blocs/movie_bloc.dart';
import 'package:peliculas_prueba/screens/screens.dart';

void main() => runApp(const BlocsProvider());

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Películas App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen()
      },
      // initialRoute: 'home',
      // routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.grey[200]))),
    );
  }
}

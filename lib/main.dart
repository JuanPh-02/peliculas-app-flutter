import 'package:flutter/material.dart';
import 'package:peliculas_prueba/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Películas App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.grey[200]))
      ),
    );
  }
}
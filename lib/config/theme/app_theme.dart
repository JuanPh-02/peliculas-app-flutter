import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 13, 71, 161);

class AppTheme {
  AppTheme();

  ThemeData getLightTheme() => ThemeData(
        scaffoldBackgroundColor: Colors.grey[350],
        focusColor: const Color(0xAAFFFFFF),
        cardColor: const Color(0xDDFFFFFF),
        iconTheme: IconThemeData(color: Colors.grey[200], size: 26),
        brightness: Brightness.light,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
      );

  ThemeData getDarkTheme() => ThemeData(
        scaffoldBackgroundColor: Colors.blue[900],
        focusColor: const Color(0x33FFFFFF),
        cardColor: const Color(0xFF232F3D),
        iconTheme: IconThemeData(color: Colors.grey[200], size: 26),
        brightness: Brightness.dark,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
      );
}
